
namespace 'CodeFabric.Shopify.Collections', (ns) ->

  models = CodeFabric.Shopify.Models;
  shopify = CodeFabric.Shopify;

  ns.Shops = new Mongo.Collection shopify.CollectionNames.Shops

  ns.Shops.allow
    insert: (userId, shop) -> false
    update: (userId, shop) -> false
    remove: (userId, shop) -> false

  return ['Shops', ns.Shops]