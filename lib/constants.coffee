namespace 'CodeFabric.Shopify', (ns) ->

    @MethodNames =
      CheckAuth: 'CodeFabric.Shopify.App.CheckAuth'
      CompleteAuth: 'CodeFabric.Shopify.App.CompleteAuth'
      CallApiMethod: 'CodeFabric.Shopify.Api.CallMethod'
      CallApiConcatMethod: 'CodeFabric.Shopify.Api.CallConcatMethod'

    @CollectionNames =
      Shops: 'CodeFabric.Shopify.Collections.Shops'

    @PublicationNames =
      ShopsByName: 'CodeFabric.Shopify.Publications.ShopsByName'

    Object.freeze @MethodNames
    Object.freeze @CollectionNames
    Object.freeze @PublicationNames

  return [
    'MethodNames', @MethodNames,
    'CollectionNames', @CollectionNames,
    'PublicationNames', @PublicationNames
  ]