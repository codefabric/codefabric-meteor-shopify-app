namespace 'CodeFabric.Shopify', (ns) ->

  class Api extends ns.ApiBase
    constructor: ->
      super()

    call: (method, params, callback) ->
      check method, String
      check params, Match.Optional(Object)
      check callback, Function

      Meteor.call(ns.MethodNames.CallApiMethod, method, params, (error, result) =>
        if (@handleError error)
          callback result
        else
          throw new Meteor.Error 'call-failed', 'Could not call method ' + method
      )

    callConcat: (method, params, callback) ->
      check method, String
      check params, Match.Optional(Object)
      check callback, Function

      Meteor.call(ns.MethodNames.CallApiConcatMethod, method, params, (error, result) =>
        if (@handleError error)
          callback result
        else
          throw new Meteor.Error 'concat-call-failed', 'Could not call concat method ' + method
      )

  return ['Api', Api]