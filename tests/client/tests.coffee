# tests.coffee

Tinytest.add "Cannot create a Shopify.App without settings", (test) ->
  settings = null
  
  test.throws((() ->
    new CodeFabric.Shopify.App()
  ), "Match error")

Tinytest.add "Create Shopify.App with settings", (test) ->
  settings =
    apiKey: 'test'
    shop: 'someshop'

  app = new CodeFabric.Shopify.App settings
  test.isNotNull app
  test.equal app.apiKey, 'test'
  test.equal app.shopName, 'someshop'
  
Tinytest.add "Authenticate Shopify.App does something", (test) ->
  settings =
    apiKey: 'test'
    shop: 'someshop'

  prevColl = CodeFabric.Shopify.Collections.Shops
  CodeFabric.Shopify.Collections.Shops = new Mongo.Collection(null)

  prev = Meteor.call

  Meteor.call = (name, param, callback) ->
    if name == 'CodeFabric.Shopify.App.createShop'
      return CodeFabric.Shopify.Collections.Shops.insert({ name: param, hasToken: false })
    else
      return prev name, param, callback

  app = new CodeFabric.Shopify.App settings
  app.authenticate()

  Meteor.call = prev
  CodeFabric.Shopify.Collections.Shops = prevColl
  
Tinytest.addAsync "Authenticate Shopify.App creates a user", (test, next) ->
  settings =
    apiKey: 'test'
    shop: 'someshop'


  prevColl = CodeFabric.Shopify.Collections.Shops
  CodeFabric.Shopify.Collections.Shops = new Mongo.Collection(null)

  prev = Meteor.call

  Meteor.call = (name, param, callback) ->
    if name == 'CodeFabric.Shopify.App.createShop'
      return CodeFabric.Shopify.Collections.Shops.insert({ name: param, hasToken: false })
    else
      return prev name, param, callback

  app = new CodeFabric.Shopify.App settings
  app.authenticate()

  Meteor.setTimeout (() ->
    try 
      shop = CodeFabric.Shopify.Collections.Shops.find({ name: 'someshop' })
      test.isNotNull shop

      next()
    catch err
      test.exception err
    finally
      Meteor.call = prev
      CodeFabric.Shopify.Collections.Shops = prevColl
  ), 10
