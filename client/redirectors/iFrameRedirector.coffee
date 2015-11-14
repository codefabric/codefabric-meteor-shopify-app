namespace 'CodeFabric.Shopify.Redirectors', (ns) ->

  class IFrameRedirector extends CodeFabric.Shopify.Redirector
    constructor: ->
      super()
    redirect: (url) ->
      window.top.location.href = url

  return ['IFrameRedirector', IFrameRedirector]