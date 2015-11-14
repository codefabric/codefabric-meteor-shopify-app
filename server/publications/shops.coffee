
namespace 'CodeFabric.Shopify', (ns) ->

  collections = CodeFabric.Shopify.Collections

  if Meteor.settings.debug
    console.log "Starting publication of #{ns.PublicationNames.ShopsByName}"
  Meteor.publish ns.PublicationNames.ShopsByName, (shopName) ->
    if Meteor.settings.debug
      console.log "Got a subscriber for #{shopName}"
    return collections.Shops.find({ name: shopName }, { fields: { token: 0 } })