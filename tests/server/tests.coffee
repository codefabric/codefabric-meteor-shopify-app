# tests.coffee

Tinytest.add "Cannot create a Shopify.App without settings", (test) ->
  settings = null
  
  test.throws((() ->
    new CodeFabric.Shopify.App()
  ), "Match error")

Tinytest.add "Create Shopify.App with settings", (test) ->
  settings =
    apiKey: 'test'
    secret: 'somesecret'

  app = new CodeFabric.Shopify.App settings
  test.isNotNull app
  test.equal app.apiKey, 'test'
  test.equal app.secret, 'somesecret'
  
Tinytest.add "Authenticate Shopify.App does something", (test) ->
  settings =
    apiKey: 'test'
    secret: 'somesecret'

  app = new CodeFabric.Shopify.App settings
  app.initShopifyAuth()