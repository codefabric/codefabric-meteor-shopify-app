namespace 'CodeFabric.Shopify', (ns) ->

  class ShopifyESDKView extends CodeFabric.View

    constructor: (template, options) ->
      super template


  return CodeFabric.Resolver.depends
    name: 'ShopifyESDKView'
    constructor: ShopifyESDKView
    dependencies:
      template: 'template'
      options: 'options'