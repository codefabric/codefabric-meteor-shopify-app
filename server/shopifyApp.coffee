namespace 'CodeFabric.Shopify', (ns) ->

  valid = CodeFabric.Validation
  collections = CodeFabric.Shopify.Collections

  class App extends ns.AppBase
    @current = null

    constructor: (settings, onAuth) ->
      if ns.App.current
        throw new Meteor.Error 'singleton-failure', 'You can only create a single instance of App'

      check settings,
        name: String
        apiKey: String
        redirectUrl: Match.Optional(String)
        secret: Match.Optional(String)
        password: Match.Optional(String)
        scope: Match.Optional([Match.Where (x) -> (valid.Check.IsIn x, ns.AllScopes)])

      unless (settings.secret? or settings.password?)
        throw new Meteor.Error 'invalid-parameters', 'You must specify either a secret or a password!'

      if (settings.secret? and settings.password?)
        throw new Meteor.Error 'invalid-parameters', 'You must specify either a secret OR a password (not both)!'

      @name = settings.name
      @apiKey = settings.apiKey
      @secret = settings.secret
      @password = settings.password

      @redirectUrl = Meteor.absoluteUrl(settings.redirectUrl ||  '/')
      @scope = settings.scope || ns.AllScopes

      @isPublic = @secret?
      @api = { }

      @onAuthCallback = onAuth

      ns.App.current = @

      @setupMeteorMethods()

      super()

    setupMeteorMethods: ->
      methods = { }

      methods[ns.MethodNames.CheckAuth] = (shopName) -> ns.App.current.checkAuth @, shopName
      methods[ns.MethodNames.CompleteAuth] = (shopName, responseParams) -> ns.App.current.completeAuth @, shopName, responseParams

      Meteor.methods methods

    getShopAPI: (shop) ->
      return @api[shop]

    checkAuth: (conn, shopName) =>
      isAuthorised = false

      shop = collections.Shops.findOne({ name: shopName })
      if shop
        isAuthorised = shop.hasToken
      else
        id = collections.Shops.insert({ name: shopName, hasToken: false })
        shop = collections.Shops.findOne({ _id: id })

      if isAuthorised
        if !@api[shop.name]
          if Meteor.settings.public.debug
            console.log "Creating API for #{shop.name}"
          @api[shop.name] = new ns.Api shop

        if @onAuthCallback
          @onAuthCallback @api[shop.name], conn

        return { isAuthorised: true }
      else
        authUrl = @buildAuthUrl shop
        return { isAuthorised: false, authUrl: authUrl }

    buildAuthUrl: (shop) ->
      authUrl = "https://#{shop.name}.myshopify.com/admin/oauth/authorize?client_id=#{@apiKey}&scope=#{@scope.join(',')}&redirect_uri=#{encodeURIComponent(@redirectUrl)}&state=#{shop._id}"
      if Meteor.settings.public.debug
        console.log "Built auth url: #{authUrl}"

      return authUrl

    completeAuth: (conn, shopName, responseParams) =>
      check responseParams, Match.ObjectIncluding
        hmac: String
        state: String
        code: String

      try
        # Verify that the requet came from us - i.e. the state matches the id of shopName
        shop = collections.Shops.findOne({ _id: responseParams.state, name: shopName })
        unless shop
          throw new Meteor.Error 'invalid-auth-res', 'The validation response is invalid!', 'Could not find shop ' + shopName + ' with id ' + responseParams.state

        # Validate the hmac
        unless (@validateHmac responseParams.hmac, responseParams)
          throw new Meteor.Error 'invalid-auth-res', 'The validation response is invalid!', 'HMAC was invalid'

        # Retrieve a permanent token
        token = @requestPermanentToken shop, responseParams.code
        unless token
          throw new Meteor.Error 'auth-failed', 'Failed to get token from Shopify!'

        # Update the shop with the token
        collections.Shops.update shop._id, $set: { token: token, hasToken: true }
        shop = collections.Shops.findOne({_id: shop._id})

        #Create the server API
        if Meteor.settings.public.debug
          console.log "Creating API for #{shopName}"
        @api[shopName] = new ns.Api shop

        if @onAuthCallback
          @onAuthCallback @api[shopName], conn

        # Return
        return { isAuthorised: true }

      catch err
        @handleError err
        throw err

    validateHmac: (hmac, hmacParams) ->
      try
        messageParams = hmacParams
        if messageParams.hmac
          delete messageParams.hmac
        if messageParams.signature
          delete messageParams.signature

        params = []
        params.push "#{key}=#{value}" for key, value of messageParams
        message = params.join '&'

        generated = CryptoJS.HmacSHA256(message, @secret).toString()
        if Meteor.settings.public.debug
          console.log "Generated HMAC: #{generated} (#{generated.length})"
          console.log "Supplied HMAC: #{hmac} (#{hmac.length})"
        
        isValid = (hmac == generated)
        if Meteor.settings.public.debug
          console.log "is valid: #{isValid}"

        return isValid
      catch e
        console.log e
        return false

    requestPermanentToken: (shop, code) ->
      try
        tokenUrl = "https://#{shop.name}.myshopify.com/admin/oauth/access_token"

        if Meteor.settings.public.debug
          console.log "Token URL: #{tokenUrl}"
          console.log "Data: #{@apiKey}, #{@secret}, #{code}"

        response = HTTP.post tokenUrl,
          data:
            client_id: @apiKey
            client_secret: @secret,
            code: code

        if response.statusCode == 200
          return response.data.access_token
        else
          if Meteor.settings.public.debug
            console.log response
          throw new Meteor.Error 'auth-failed', "Shopify token request failed with status #{response.statusCode}"

      catch e
        console.log e
        throw e

  return ['App', App]




