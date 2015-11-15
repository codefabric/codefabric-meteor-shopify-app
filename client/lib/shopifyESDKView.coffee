namespace 'CodeFabric.Shopify', (ns) ->

  class ShopifyESDKView extends CodeFabric.View

    constructor: (template, @title, @buttons) ->
      @callbacks = {}

      if @buttons.primary.callback?
        @buttons.primary.message = @__buildCallbackMessage @buttons.primary.callback
        delete @buttons.primary.callback

      for secBut, idx in @buttons.secondary
        if secBut.callback?
          @buttons.secondary[idx].message = @__buildCallbackMessage secBut.callback
          delete @buttons.secondary[idx].callback

      super template

    onRendered: =>
      window.addEventListener 'message', @__handleMessage
      if ShopifyApp?
        ShopifyApp.Bar.initialize 
          title: @title
          buttons: @buttons

    onDestroyed: =>
      window.removeEventListener 'message', @__handleMessage


    __buildCallbackMessage: (callback) ->
      callbackId = (new Mongo.ObjectID()).valueOf()
      @callbacks[callbackId] = callback
      return "_callback:#{callbackId}"


    __handleMessage: (e) =>
      try
        data = JSON.parse e.data
        dataParts = data.message.split(':')
        if dataParts[0] == "_callback" && dataParts.length > 1
          if @callbacks[dataParts[1]]?
            @callbacks[dataParts[1]]()

        else if @onMessage?
          @onMessage data

      catch e


  return CodeFabric.Resolver.depends
    name: 'ShopifyESDKView'
    constructor: ShopifyESDKView
    dependencies:
      template: 'template'
      options: 'options'