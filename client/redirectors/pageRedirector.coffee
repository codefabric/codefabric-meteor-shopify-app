namespace 'CodeFabric.Shopify.Redirectors', (ns) ->

  class PageRedirector extends CodeFabric.Shopify.Redirector
    constructor: ->
      super()
    redirect: (url) ->
      location.href = url

  return ['PageRedirector', PageRedirector]