#CodeFabric Shopify App Meteor Package

This package provides a foundation on which to build Shopify Apps using Meteor.  It wraps the OAuth process to make it simpler to authorise your app, as well as wrapping the Shopify API and providing access to the Shopify Embedded App SDK.

This package was inspired by the [great Shopify API package by froatsnook](https://atmospherejs.com/froatsnook/shopify).

Details of how (and why) this package was created can be found in the [CodeFabric - Shopify App Development series](http://codefabric.co.uk/development/shopify-app-development/).

## Package usage

Include the package in your project:

```
meteor add codefabric:meteor-shopify-app
```

## Basic usage

For advanced and detailed usage information, please refer to [CodeFabric - Shopify App Meteor package usage](http://codefabric.co.uk/meteor/shopify-app-meteor-package-usage/).

### Authentication

On the server, at startup, create a new Shopify App, providing your App name (for the Embedded App title bar), API key, secret, and an optional auth callback function:

```javascript
var shopifyApp = new CodeFabric.Shopify.App({
                    name: "My Awesome App",
                    apiKey: "s0m3Shop1fyAP1K3y",
                    secret: "s0m3Shop1fyAppS3cr3t"
                  }, function (api, connection) {
                    if (connection) {
                      // Set the user id of the connection to the shop name, so we don't need to 
                      // pass it along with every method call (optional)
                      connection.setUserId(api.shop.name);
                    }
                  });
```

On the client, create a new Shopify App, providing the shop name, your API key and an optional auth callback function:

```javascript
var shopifyApp = new CodeFabric.Shopify.App({
                    shop: "someshop.myshopify.com",
                    apiKey: "s0m3Shop1fyAP1K3y"
                  }, function (app) {
                    // Do something after authentication
                  });
```

Then authenticate the app by calling `authenticate()` on the client:

```javascript
shopifyApp.authenticate();
```

This will redirect the user to the app authorisation page within the store, which will redirect them to your app once they approve it.  By default, the user will be redirected to the root of your Meteor application ('/'); this can be overridden by passing a `redirectUrl` parameter to the server-side Shopify App object.

When redirected, your client must call `authenticate()` again, in order to retrieve a permanent token:

```javascript
shopifyApp.authenticate();
```

If using Iron Router, it is useful to place the `authenticate()` call in a `beforeRoute` handler, which will ensure the user is always authenticated.

### API usage

Once authenticated, the `App` object exposes an `api` property, which gives access to the [Shopify API](https://docs.shopify.com/api).

Each of the standard methods of the API are exposed on the `api` object:

```javascript
var products = shopifyApp.api.getProducts();
var orders = shopifyApp.api.getOrders();
var customers = shopifyApp.getCustomers();

var moreProducts = shopifyApp.api.getProducts({
                      limit: 250,
                      page: 2
                    });

var theProduct = shopifyApp.api.getProduct({ id: 12345 });

shopifyApp.modifyProduct(
  id: 12345,
  product: {
    id: 12345,
    tags: "some, tags, here"
  });
...
```

Method parameters (as specified in the API documentation) can be passed to the methods as an object argument.

NB: Get... methods will only return the default of 50 items.  Limit and page parameters can be used (as in the `moreProducts` example above), or special getAll... methods can be used to retrieve all items (e.g. `getAllProducts()`)

### Throttling and rate limiting

The API will automatically throttle calls to Shopify to comply with the [API call limit](https://docs.shopify.com/api/introduction/api-call-limit).

For advanced and detailed usage information, please refer to [CodeFabric - Shopify App Meteor package usage](http://codefabric.co.uk/meteor/shopify-app-meteor-package-usage/).


