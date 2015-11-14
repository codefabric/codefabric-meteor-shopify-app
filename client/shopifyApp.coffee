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
        redirectType: Match.Optional Match.OneOf(App.RedirectTypes.Page, App.RedirectTypes.IFrame, App.RedirectTypes.NewTab)

      @shop = settings.shop
      @redirectType = settings.redirectType || App.RedirectTypes.Page

      super()

    authenticate: (callback) ->
      url = @parseCurrentUrl()

      if (@isAuthCallback url)
        Meteor.call(ns.MethodNames.CompleteAuth, @shop, url.params, (error, result) =>
          try
            if (@handleError error)
              if result.isAuthorised
                @createAPI()
                if callback
                  callback @, true
              else
                throw new Meteor.Error 'authorisation-failure', 'Authorisation for the app has failed!'
            else
              throw error
          catch err
            @handleError err
            throw err
        )
      else
        Meteor.call(ns.MethodNames.CheckAuth, @shop, (error, result) =>
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

    isAuthCallback: (url) ->
      return (url.params.code? and url.params.hmac? and url.params.timestamp? and url.params.state?)

    parseCurrentUrl: () ->
      host = location.host
      path = location.pathName
      params = {}
      for pair in location.search.replace("?", "").split "&"
        [k, v] = pair.split("=")
        params[k] = v
      
      return { host: host, path: path, params: params }

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


