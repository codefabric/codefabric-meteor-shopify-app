namespace 'CodeFabric.Shopify', (ns) ->

  class ApiBase extends CodeFabric.Base
    @Methods: { }
    @ConcatMethods: { }

    constructor: ->
      for name, method of ns.ApiMethods
        @define name, method

      for cName, cMethod of ns.ApiConcatMethods
        @defineConcat cName, cMethod

      super()

    define: (name, method) ->
      check name, String
      check method.url, String
      check method.method, Match.Optional(Match.OneOf('GET', 'POST', 'PUT', 'DELETE'))
      check method.returns, Match.Optional(String)

      ApiBase.Methods[name] = method
      @[name] = (params, callback) -> @call name, params, callback

    defineConcat: (name, method) ->
      check name, String
      check method.count, String
      check method.fetch, String

      if !ApiBase.Methods[method.count]?
        throw new Meteor.Error 'count-method-not-found', "Cannot find the count method '#{method.count}'"

      if !ApiBase.Methods[method.fetch]?
        throw new Meteor.Error 'fetch-method-not-found', "Cannot find the fetch method '#{method.fetch}'"

      ApiBase.ConcatMethods[name] = method
      @[name] = (params, callback) -> @callConcat name, params, callback

    call: (method, params, callback) ->
      check method, String
      check params, Match.Optional(Object)
      check callback, Function

      throw new Meteor.Error 'not-implemented', 'This should be overridden!'

    callConcat: (method, params, callback) ->
      check method, String
      check params, Match.Optional(Object)
      check callback, Function

      throw new Meteor.Error 'not-implemented', 'This should be overridden!'

  return ['ApiBase', ApiBase]