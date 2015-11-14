
namespace 'CodeFabric.Shopify.Models', () ->

  class Shop extends CodeFabric.Model
    constructor: (shop) ->
      @extend shop
      super()

  return ['Shop', Shop]