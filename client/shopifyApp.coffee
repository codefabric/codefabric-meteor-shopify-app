namespace 'CodeFabric.Shopify', (ns) ->

  validators = CodeFabric.Validators
  redirectors = CodeFabric.Shopify.Redirectors

  class App extends ns.AppBase
    @RedirectTypes: 
      Page: 'redirect'
      IFrame: 'iframe'
      NewTab: 'newTab'

    constructor: (settings) ->
      check settings, 
        shop: String,
        apiKey: String
        redirectType: Match.Optional Match.OneOf(App.RedirectTypes.Page, App.RedirectTypes.IFrame, App.RedirectTypes.NewTab)
        isEmbedded: Match.Optional(Boolean)

      @shop = settings.shop
      @redirectType = settings.redirectType 
      @isEmbedded = settings.isEmbedded || true
      @apiKey = settings.apiKey

      if !@redirectType?
        if @isEmbedded 
          @redirectType = App.RedirectTypes.IFrame
        else
          @redirectType = App.RedirectTypes.Page

      if @isEmbedded
        @initShopifyESDK()
        
      super()

    authenticate: (callback) ->
      url = @parseCurrentUrl()

      Meteor.call(ns.MethodNames.Authenticate, @shop, url.params, (error, result) =>
        try
          if (@handleError error)
            if result.isAuthorised
              @createAPI()

              if callback
                callback @
            else
              @authoriseApp result.authUrl
          else
            throw error
        catch err
          @handleError err
          throw err
      )

    parseCurrentUrl: () ->
      host = location.host
      path = location.pathName
      params = {}
      for pair in location.search.replace("?", "").split "&"
        [k, v] = pair.split("=")
        params[k] = v
      
      return { host: host, path: path, params: params }

    initShopifyESDK: ->
      if ShopifyApp?
        ShopifyApp.init
          apiKey: @apiKey
          shopOrigin: "https://#{@shop}.myshopify.com"   
          debug: Meteor.settings.public.debug

        ShopifyApp.Bar.loadingOff()

    createAPI: ->
      @api = new ns.Api

    authoriseApp: (authUrl) ->
      @authUrl = authUrl

      redirector = null
      switch @redirectType
        when App.RedirectTypes.Page then redirector = new redirectors.PageRedirector()
        when App.RedirectTypes.IFrame then redirector = new redirectors.IFrameRedirector()
        #when App.RedirectTypes.NewTab then redirector = new redirectors.NewTabRedirector()

      redirector.redirect authUrl

  return ['App', App]


