namespace 'CodeFabric.Shopify', (ns) ->

  class ApiBase extends CodeFabric.Base
    @Methods: { }

    constructor: ->
      for name, method of ns.ApiMethods
        @define name, method

      super()

    define: (name, method) ->
      check name, String
      check method.url, String
      check method.method, Match.Optional(Match.OneOf('GET', 'POST', 'PUT', 'DELETE'))

      ApiBase.Methods[name] = method
      @[name] = (params) -> @call name, params

    call: (method, params, callback) ->
      check method, String
      check params, Match.Optional(Object)
      check callback, Function

      throw new Meteor.Error 'not-implemented', 'This should be overridden!'

  return ['ApiBase', ApiBase]