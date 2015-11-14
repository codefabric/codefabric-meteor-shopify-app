namespace 'CodeFabric.Shopify', (ns) ->

  # Base class of client/server Shopify App classes
  class AppBase extends CodeFabric.Base
    constructor: ->
      super()

  return ['AppBase', AppBase]
