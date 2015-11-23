namespace 'CodeFabric.Shopify', (ns) ->

  class Api extends ns.ApiBase
    constructor: (shop, settings) ->
      check shop,
        _id: String
        name: String
        token: String
        hasToken: Boolean
      check settings, Match.Optional(Object)

      @shop = shop

      options = settings || { }

      @currentReqs = 0
      @callQueue = []
      @maxCallLimit = options.maxCallLimit || 35
      @currentCallLimit = 0
      @pageSize = options.pageSize || 250

      @headers = options.headers || { }

      super()

    call: (method, params) =>
      check method, String
      check params, Match.Optional(Object)

      try
        apiMethod = Api.Methods[method]
        unless apiMethod?
          throw new Meteor.Error 'method-not-found', 'Could not find Shopify API method ' + method

        request = @buildRequest apiMethod, params

        makeRequestSync = Meteor.wrapAsync(@makeRequestAsync)
        result = makeRequestSync request

        if apiMethod.returns? and result[apiMethod.returns]?
          return result[apiMethod.returns]

        return result

      catch err
        @handleError err
        throw new Meteor.Error 'call-failed', 'Could not call method ' + method, err.reason

    callConcat: (method, params) =>
      check method, String
      check params, Match.Optional(Object)

      if !Api.ConcatMethods[method]?
        throw new Meteor.Error 'method-not-found', "Cannot find the concat method '#{method}'"

      concatMethod = Api.ConcatMethods[method]

      if !Api.Methods[concatMethod.count]?
        throw new Meteor.Error 'count-method-not-found', "Cannot find the count method '#{concatMethod.count}'"

      if !Api.Methods[concatMethod.fetch]?
        throw new Meteor.Error 'fetch-method-not-found', "Cannot find the fetch method '#{concatMethod.fetch}'"

      try
        page = 0
        countParams = params || { }
        count = @call concatMethod.count, countParams

        if Meteor.settings.public.debug
          console.log "Count of items returned from #{concatMethod.count}: #{count}"

        results = []
        fetchParams = params || { }
        while (page * @pageSize) <= count
          callResult = @callConcatPage concatMethod.fetch, fetchParams, (page + 1), @pageSize
          results = results.concat callResult
          page++


        return results
      catch err
        @handleError err
        throw new Meteor.Error 'concat-call-failed', "Could not call concat method '#{method}'", err.reason

    callConcatPage: (method, params, page, limit) =>
      callParams = params || { }
      callParams.page = page
      callParams.limit = limit

      return @call method, callParams

    buildRequest: (apiMethod, params) =>
      url = apiMethod.url.replace /^[\/]?(.+)$/, "$1"
      request = 
        method: apiMethod.method || 'GET'
        url: "https://#{@shop.name}.myshopify.com/#{url}"
        options: { }

      allParams = @clone params

      if Meteor.settings.public.debug
        console.log allParams
      for name, value of allParams
        if Meteor.settings.public.debug
          console.log "name: #{name}, value: #{value}"
        if (request.url.indexOf "\#{#{name}}") > 0
          request.url = request.url.replace "\#{#{name}}", value
          delete allParams[name]

      if request.method == 'GET'
        request.options.params = allParams
      else  
        request.options.data = allParams

      request.options.headers = { }
      request.options.headers["X-Shopify-Access-Token"] = @shop.token
      for name, value of @headers
        unless request.options.headers[name]?
          request.options.headers[name] = value

      return request

    clone: (obj) =>
      return obj if obj is null or typeof (obj) isnt "object"
      temp = new obj.constructor()
      for key of obj
        temp[key] = @clone obj[key]

      return temp

    tryExecute: (func) =>
      if @currentCallLimit < @maxCallLimit
        if Meteor.settings.public.debug
          console.log 'Executing function immediately'

        Meteor.setTimeout func, 0
      
      else
        if @callQueue.length == 0
          Meteor.setTimeout @processCallQueue, 0

        @callQueue.push func

    processCallQueue: () =>
      if @callQueue.length > 0
        
        if Meteor.settings.public.debug
          id = (new Mongo.ObjectID()).valueOf()
          console.log "Waiting to execute function : #{id}"

        Meteor.setTimeout (() =>
          try
            Meteor.setTimeout @processCallQueue, 0

            func = @callQueue.shift() # Take the first array element
            if Meteor.settings.public.debug
              console.log "Executing function now : #{id}"
            func()
          catch e
            console.log "Error processing queue: #{e}"
        ), 500

    makeRequestAsync: (request, callback) =>
      @tryExecute () =>
        @currentReqs += 1

        if Meteor.settings.public.debug
          console.log 'Performing ' + request.method + ' request to ' + request.url
          console.log 'Options:'
          console.log request.options
        try
          response = HTTP.call request.method, request.url, request.options

          callLimitHeader = response.headers['x-shopify-shop-api-call-limit']
          if callLimitHeader?
            callLimitValues = callLimitHeader.split '/'
            if callLimitValues.length > 0
              callLimitValue = Number callLimitValues[0]
              unless (isNaN callLimitValue)
                if Meteor.settings.public.debug
                  console.log "Modifying call limit to: #{callLimitValue}"

                @currentCallLimit = callLimitValue

          if 200 <= response.statusCode < 299
            return callback null, response.data
          else if response.statusCode == 429
            @makeRequestAsync request, callback
          else
            callback (new Meteor.Error 'bad-response', 'Bad response received from ' + request.url + ' (' + response.statusCode + ')'), null

        catch err
          callback err, null
        finally
          @currentReqs -= 1

  return ['Api', Api]

