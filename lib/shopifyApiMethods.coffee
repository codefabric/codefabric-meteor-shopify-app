namespace 'CodeFabric.Shopify', (ns) ->

  ns.ApiMethods =
    getPolicies:
        method: 'GET',
        url: '/admin/policies.json',
        returns: 'policies',
        description: 'Receive a list of all Policies'
    
    createRecurringApplicationCharge:
        method: 'POST',
        url: '/admin/recurring_application_charges.json',
        returns: 'recurring_application_charge',
        description: 'Create a recurring application charge'
    
    getRecurringApplicationCharge:
        method: 'GET',
        url: '/admin/recurring_application_charges/#{id}.json',
        returns: 'recurring_application_charge',
        description: 'Receive a single RecurringApplicationCharge'
    
    getRecurringApplicationCharges:
        method: 'GET',
        url: '/admin/recurring_application_charges.json',
        returns: 'recurring_application_charges',
        description: 'Retrieve all recurring application charges'
    
    activateRecurringApplicationCharge:
        method: 'POST',
        url: '/admin/recurring_application_charges/#{id}/activate.json',
        description: 'Activate a recurring application charge'
    
    cancelRecurringApplicationCharge:
        method: 'DELETE',
        url: '/admin/recurring_application_charges/#{id}.json',
        description: 'Cancel a recurring application charge'
    
    getMetafields:
        method: 'GET',
        url: '/admin/metafields.json',
        returns: 'metafields',
        description: 'Get metafields that belong to a store'
    
    getProductMetafields:
        method: 'GET',
        url: '/admin/products/#{id}/metafields.json',
        returns: 'metafields',
        description: 'Get metafields that belong to a product'
    
    countMetafields:
        method: 'GET',
        url: '/admin/metafields/count.json',
        returns: 'count',
        description: 'Get a count of metafields that belong to a store'
    
    countProductMetafields:
        method: 'GET',
        url: '/admin/products/#{id}/metafields/count.json',
        returns: 'count',
        description: 'Get a count of metafields that belong to a product'
    
    getMetafieldById:
        method: 'GET',
        url: '/admin/metafields/#{id}.json',
        returns: 'metafield',
        description: 'Get a single store metafield by its ID'
    
    getProductMetafieldById:
        method: 'GET',
        url: '/admin/products/#{productId}/metafields/#{id}.json',
        returns: 'metafield',
        description: 'Get a single product metafield by its ID'
    
    createMetafield:
        method: 'POST',
        url: '/admin/metafields.json',
        returns: 'metafield',
        description: 'Create a new metafield for a store'
    
    createProductMetafield:
        method: 'POST',
        url: '/admin/products/#{id}/metafields.json',
        returns: 'metafield',
        description: 'Create a new metafield for a product'
    
    modifyMetafield:
        method: 'PUT',
        url: '/admin/metafields/#{id}.json',
        returns: 'metafield',
        description: 'Update a store metafield'
    
    modifyProductMetafield:
        method: 'PUT',
        url: '/admin/products/#{productId}/metafields/#{id}.json',
        returns: 'metafield',
        description: 'Update a product metafield'
    
    removeMetafield:
        method: 'DELETE',
        url: '/admin/metafields/#{id}.json',
        description: 'Delete a store metafield'
    
    removeProductMetafield:
        method: 'DELETE',
        url: '/admin/products/#{productId}/metafields/#{id}.json',
        description: 'Delete a product metafield'
    
    getWebhooks:
        method: 'GET',
        url: '/admin/webhooks.json',
        returns: 'webhooks',
        description: 'Receive a list of all Webhooks'
    
    countWebhooks:
        method: 'GET',
        url: '/admin/webhooks/count.json',
        returns: 'count',
        description: 'Receive a count of all Webhooks'
    
    getWebhook:
        method: 'GET',
        url: '/admin/webhooks/#{id}.json',
        returns: 'webhook',
        description: 'Receive a single Webhook'
    
    createWebhook:
        method: 'POST',
        url: '/admin/webhooks.json',
        returns: 'webhook',
        description: 'Create a new Webhook'
    
    modifyWebhook:
        method: 'PUT',
        url: '/admin/webhooks/#{id}.json',
        returns: 'webhook',
        description: 'Modify an existing Webhook'
    
    removeWebhook:
        method: 'DELETE',
        url: '/admin/webhooks/#{id}.json',
        description: 'Remove a Webhook from the database'
    
    getProvinces:
        method: 'GET',
        url: '/admin/countries/#{id}/provinces.json',
        returns: 'provinces',
        description: 'Receive a list of all Provinces'
    
    countProvinces:
        method: 'GET',
        url: '/admin/countries/#{id}/provinces/count.json',
        returns: 'count',
        description: 'Receive a count of all Provinces'
    
    getProvince:
        method: 'GET',
        url: '/admin/countries/#{countryId}/provinces/#{id}.json',
        returns: 'province',
        description: 'Receive a single Province'
    
    modifyProvince:
        method: 'PUT',
        url: '/admin/countries/#{countryId}/provinces/#{id}.json',
        returns: 'province',
        description: 'Modify an existing Province'
    
    getCustomerSavedSearches:
        method: 'GET',
        url: '/admin/customer_saved_searches.json',
        returns: 'customer_saved_searches',
        description: 'Receive a list of all CustomerSavedSearches'
    
    countCustomerSavedSearches:
        method: 'GET',
        url: '/admin/customer_saved_searches/count.json',
        returns: 'count',
        description: 'Receive a count of all CustomerSavedSearches'
    
    getCustomerSavedSearch:
        method: 'GET',
        url: '/admin/customer_saved_searches/#{id}.json',
        returns: 'customer_saved_search',
        description: 'Receive a single CustomerSavedSearch'
    
    getCustomersFromCustomerSavedSearch:
        method: 'GET',
        url: '/admin/customer_saved_searches/#{id}/customers.json',
        returns: 'customers',
        description: 'Receive all Customers resulting from a Customer Saved Search'
    
    createCustomerSavedSearch:
        method: 'POST',
        url: '/admin/customer_saved_searches.json',
        returns: 'customer_saved_search',
        description: 'Create a new CustomerSavedSearch'
    
    modifyCustomerSavedSearch:
        method: 'PUT',
        url: '/admin/customer_saved_searches/#{id}.json',
        returns: 'customer_saved_search',
        description: 'Modify an existing CustomerSavedSearch'
    
    removeCustomerSavedSearch:
        method: 'DELETE',
        url: '/admin/customer_saved_searches/#{id}.json',
        description: 'Remove a CustomerSavedSearch from the database'
    
    getVariants:
        method: 'GET',
        url: '/admin/products/#{id}/variants.json',
        returns: 'variants',
        description: 'Receive a list of all Product Variants'
    
    countVariants:
        method: 'GET',
        url: '/admin/products/#{id}/variants/count.json',
        returns: 'count',
        description: 'Receive a count of all Product Variants'
    
    getVariant:
        method: 'GET',
        url: '/admin/variants/#{id}.json',
        returns: 'variant',
        description: 'Receive a single Product Variant'
    
    createVariant:
        method: 'POST',
        url: '/admin/products/#{id}/variants.json',
        returns: 'variant',
        description: 'Create a new Product Variant'
    
    modifyVariant:
        method: 'PUT',
        url: '/admin/variants/#{id}.json',
        returns: 'variant',
        description: 'Modify an existing Product Variant'
    
    removeVariant:
        method: 'DELETE',
        url: '/admin/products/#{productId}/variants/#{id}.json',
        description: 'Remove a Product Variant from the database'
    
    countCheckouts:
        method: 'GET',
        url: '/admin/checkouts/count.json',
        returns: 'count',
        description: 'Receive a count of all Checkouts'
    
    getCheckouts:
        method: 'GET',
        url: '/admin/checkouts.json',
        returns: 'checkouts',
        description: 'Receive a list of all Checkouts'
    
    getCustomers:
        method: 'GET',
        url: '/admin/customers.json',
        returns: 'customers',
        description: 'Receive a list of all Customers'
    
    searchCustomers:
        method: 'GET',
        url: '/admin/customers/search.json',
        returns: 'customers',
        description: 'Search for customers matching supplied query'
    
    getCustomer:
        method: 'GET',
        url: '/admin/customers/#{id}.json',
        returns: 'customer',
        description: 'Receive a single Customer'
    
    createCustomer:
        method: 'POST',
        url: '/admin/customers.json',
        returns: 'customer',
        description: 'Create a new Customer'
    
    modifyCustomer:
        method: 'PUT',
        url: '/admin/customers/#{id}.json',
        returns: 'customer',
        description: 'Modify an existing Customer'
    
    removeCustomer:
        method: 'DELETE',
        url: '/admin/customers/#{id}.json',
        description: 'Remove a Customer from the database'
    
    countCustomers:
        method: 'GET',
        url: '/admin/customers/count.json',
        returns: 'count',
        description: 'Receive a count of all Customers'
    
    getShop:
        method: 'GET',
        url: '/admin/shop.json',
        returns: 'shop',
        description: 'Receive a single Shop'
    
    getTransactions:
        method: 'GET',
        url: '/admin/orders/#{id}/transactions.json',
        returns: 'transactions',
        description: 'Receive a list of all Transactions'
    
    countTransactions:
        method: 'GET',
        url: '/admin/orders/#{id}/transactions/count.json',
        returns: 'count',
        description: 'Receive a count of all Transactions'
    
    getTransaction:
        method: 'GET',
        url: '/admin/orders/#{orderId}/transactions/#{id}.json',
        returns: 'transaction',
        description: 'Receive a single Transaction'
    
    createTransaction:
        method: 'POST',
        url: '/admin/orders/#{id}/transactions.json',
        returns: 'transaction',
        description: 'Create a new Transaction'
    
    getThemes:
        method: 'GET',
        url: '/admin/themes.json',
        returns: 'themes',
        description: 'Receive a list of all Themes'
    
    getTheme:
        method: 'GET',
        url: '/admin/themes/#{id}.json',
        returns: 'theme',
        description: 'Receive a single Theme'
    
    createTheme:
        method: 'POST',
        url: '/admin/themes.json',
        returns: 'theme',
        description: 'Create a new Theme'
    
    modifyTheme:
        method: 'PUT',
        url: '/admin/themes/#{id}.json',
        returns: 'theme',
        description: 'Modify an existing Theme'
    
    removeTheme:
        method: 'DELETE',
        url: '/admin/themes/#{id}.json',
        description: 'Remove a Theme from the database'
    
    getProducts:
        method: 'GET',
        url: '/admin/products.json',
        returns: 'products',
        description: 'Receive a list of all Products'
    
    countProducts:
        method: 'GET',
        url: '/admin/products/count.json',
        returns: 'count',
        description: 'Receive a count of all Products'
    
    getProduct:
        method: 'GET',
        url: '/admin/products/#{id}.json',
        returns: 'product',
        description: 'Receive a single Product'
    
    createProduct:
        method: 'POST',
        url: '/admin/products.json',
        returns: 'product',
        description: 'Create a new Product'
    
    modifyProduct:
        method: 'PUT',
        url: '/admin/products/#{id}.json',
        returns: 'product',
        description: 'Modify an existing Product'
    
    removeProduct:
        method: 'DELETE',
        url: '/admin/products/#{id}.json',
        description: 'Remove a Product from the database'
    
    getComments:
        method: 'GET',
        url: '/admin/comments.json',
        returns: 'comments',
        description: 'Receive a list of all Comments'
    
    countComments:
        method: 'GET',
        url: '/admin/comments/count.json',
        returns: 'count',
        description: 'Receive a count of all Comments'
    
    getComment:
        method: 'GET',
        url: '/admin/comments/#{id}.json',
        returns: 'comment',
        description: 'Receive a single Comment'
    
    createComment:
        method: 'POST',
        url: '/admin/comments.json',
        returns: 'comment',
        description: 'Create a new Comment'
    
    modifyComment:
        method: 'PUT',
        url: '/admin/comments/#{id}.json',
        returns: 'comment',
        description: 'Modify an existing Comment'
    
    markCommentSpam:
        method: 'POST',
        url: '/admin/comments/#{id}/spam.json',
        description: 'Mark a Comment as spam'
    
    markCommentNotSpam:
        method: 'POST',
        url: '/admin/comments/#{id}/not_spam.json',
        description: 'Mark a Comment as not spam'
    
    approveComment:
        method: 'POST',
        url: '/admin/comments/#{id}/approve.json',
        description: 'Approve a Comment'
    
    removeComment:
        method: 'POST',
        url: '/admin/comments/#{id}/remove.json',
        description: 'Remove a Comment'
    
    restoreComment:
        method: 'POST',
        url: '/admin/comments/#{id}/restore.json',
        description: 'Restore a Comment'
    
    createApplicationCharge:
        method: 'POST',
        url: '/admin/application_charges.json',
        returns: 'application_charge',
        description: 'Create a new one-time application charge'
    
    getApplicationCharge:
        method: 'GET',
        url: '/admin/application_charges/#{id}.json',
        returns: 'application_charge',
        description: 'Receive a single ApplicationCharge'
    
    getApplicationCharges:
        method: 'GET',
        url: '/admin/application_charges.json',
        returns: 'application_charges',
        description: 'Retrieve all one-time application charges'
    
    activateApplicationCharge:
        method: 'POST',
        url: '/admin/application_charges/#{id}/activate.json',
        description: 'Activate a one-time application charge'
    
    getAssets:
        method: 'GET',
        url: '/admin/themes/#{id}/assets.json',
        returns: 'assets',
        description: 'Receive a list of all Assets'
    
    getAsset:
        method: 'GET',
        url: '/admin/themes/#{id}/assets.json',
        returns: 'asset',
        description: 'Receive a single Asset'
    
    modifyAsset:
        method: 'PUT',
        url: '/admin/themes/#{id}/assets.json',
        returns: 'asset',
        description: 'Creating or Modifying an Asset'
    
    removeAsset:
        method: 'DELETE',
        url: '/admin/themes/#{id}/assets.json',
        description: 'Remove a Asset from the database'
    
    createCarrierService:
        method: 'POST',
        url: '/admin/carrier_services.json',
        returns: 'carrier_service',
        description: 'Create a new CarrierService'
    
    modifyCarrierService:
        method: 'PUT',
        url: '/admin/carrier_services/#{id}.json',
        returns: 'carrier_service',
        description: 'Modify an existing CarrierService'
    
    getCarrierServices:
        method: 'GET',
        url: '/admin/carrier_services.json',
        returns: 'carrier_services',
        description: 'Receive a list of all CarrierServices'
    
    getCarrierService:
        method: 'GET',
        url: '/admin/carrier_services/#{id}.json',
        returns: 'carrier_service',
        description: 'Receive a single CarrierService'
    
    removeCarrierService:
        method: 'DELETE',
        url: '/admin/carrier_services/#{id}.json',
        description: 'Remove a CarrierService from the database'
    
    getOrders:
        method: 'GET',
        url: '/admin/orders.json',
        returns: 'orders',
        description: 'Retrieve a list of Orders (OPEN Orders by default, use status=any for ALL orders)'
    
    getOrder:
        method: 'GET',
        url: '/admin/orders/#{id}.json',
        returns: 'order',
        description: 'Receive a single Order'
    
    countOrders:
        method: 'GET',
        url: '/admin/orders/count.json',
        returns: 'count',
        description: 'Receive a count of all Orders'
    
    closeOrder:
        method: 'POST',
        url: '/admin/orders/#{id}/close.json',
        returns: 'order',
        description: 'Close an Order'
    
    openOrder:
        method: 'POST',
        url: '/admin/orders/#{id}/open.json',
        returns: 'order',
        description: 'Re-open a closed Order'
    
    cancelOrder:
        method: 'POST',
        url: '/admin/orders/#{id}/cancel.json',
        returns: 'order',
        description: 'Cancel an Order'
    
    createOrder:
        method: 'POST',
        url: '/admin/orders.json',
        returns: 'order',
        description: 'Create a new Order'
    
    modifyOrder:
        method: 'PUT',
        url: '/admin/orders/#{id}.json',
        returns: 'order',
        description: 'Modify an existing Order'
    
    removeOrder:
        method: 'DELETE',
        url: '/admin/orders/#{id}.json',
        description: 'Remove a Order from the database'
    
    getCustomerAddresses:
        method: 'GET',
        url: '/admin/customers/#{id}/addresses.json',
        returns: 'addresses',
        description: 'Receive a list of all CustomerAddresses'
    
    getCustomerAddress:
        method: 'GET',
        url: '/admin/customers/#{customerId}/addresses/#{id}.json',
        returns: 'address',
        description: 'Receive a single CustomerAddress'
    
    createCustomerAddress:
        method: 'POST',
        url: '/admin/customers/#{id}/addresses.json',
        returns: 'address',
        description: 'Create a new CustomerAddress'
    
    modifyCustomerAddress:
        method: 'PUT',
        url: '/admin/customers/#{customerId}/addresses/#{id}.json',
        returns: 'address',
        description: 'Modify an existing CustomerAddress'
    
    removeCustomerAddress:
        method: 'DELETE',
        url: '/admin/customers/#{customerId}/addresses/#{id}.json',
        description: 'Remove a CustomerAddress from the database'
    
    bulkModifyCustomerAddresses:
        method: 'PUT',
        url: '/admin/customers/#{id}/addresses/set.json',
        description: 'Perform bulk operations against a number of addresses'
    
    setDefaultCustomerAddress:
        method: 'PUT',
        url: '/admin/customers/#{customerId}/addresses/#{id}/default.json',
        returns: 'customer_address',
        description: 'Sets default address for a customer'
    
    getArticles:
        method: 'GET',
        url: '/admin/blogs/#{id}/articles.json',
        returns: 'articles',
        description: 'Receive a list of all Articles'
    
    countArticles:
        method: 'GET',
        url: '/admin/blogs/#{id}/articles/count.json',
        returns: 'count',
        description: 'Receive a count of all Articles'
    
    getArticle:
        method: 'GET',
        url: '/admin/blogs/#{blogId}/articles/#{id}.json',
        returns: 'article',
        description: 'Receive a single Article'
    
    createArticle:
        method: 'POST',
        url: '/admin/blogs/#{id}/articles.json',
        returns: 'article',
        description: 'Create a new Article'
    
    modifyArticle:
        method: 'PUT',
        url: '/admin/blogs/#{blogId}/articles/#{id}.json',
        returns: 'article',
        description: 'Modify an existing Article'
    
    getAuthors:
        method: 'GET',
        url: '/admin/articles/authors.json',
        returns: 'authors',
        description: 'Get a list of all the authors'
    
    getTags:
        method: 'GET',
        url: '/admin/articles/tags.json',
        returns: 'tags',
        description: 'Get a list of all the tags'
    
    removeArticle:
        method: 'DELETE',
        url: '/admin/blogs/#{blogId}/articles/#{id}.json',
        description: 'Remove a Article from the database'
    
    getBlogs:
        method: 'GET',
        url: '/admin/blogs.json',
        returns: 'blogs',
        description: 'Receive a list of all Blogs'
    
    countBlogs:
        method: 'GET',
        url: '/admin/blogs/count.json',
        returns: 'count',
        description: 'Receive a count of all Blogs'
    
    getBlog:
        method: 'GET',
        url: '/admin/blogs/#{id}.json',
        returns: 'blog',
        description: 'Receive a single Blog'
    
    createBlog:
        method: 'POST',
        url: '/admin/blogs.json',
        returns: 'blog',
        description: 'Create a new Blog'
    
    modifyBlog:
        method: 'PUT',
        url: '/admin/blogs/#{id}.json',
        returns: 'blog',
        description: 'Modify an existing Blog'
    
    removeBlog:
        method: 'DELETE',
        url: '/admin/blogs/#{id}.json',
        description: 'Remove a Blog from the database'
    
    getPages:
        method: 'GET',
        url: '/admin/pages.json',
        returns: 'pages',
        description: 'Receive a list of all Pages'
    
    countPages:
        method: 'GET',
        url: '/admin/pages/count.json',
        returns: 'count',
        description: 'Receive a count of all Pages'
    
    getPage:
        method: 'GET',
        url: '/admin/pages/#{id}.json',
        returns: 'page',
        description: 'Receive a single Page'
    
    createPage:
        method: 'POST',
        url: '/admin/pages.json',
        returns: 'page',
        description: 'Create a new Page'
    
    modifyPage:
        method: 'PUT',
        url: '/admin/pages/#{id}.json',
        returns: 'page',
        description: 'Modify an existing Page'
    
    removePage:
        method: 'DELETE',
        url: '/admin/pages/#{id}.json',
        description: 'Remove a Page from the database'
    
    getLocations:
        method: 'GET',
        url: '/admin/locations.json',
        returns: 'locations',
        description: 'Receive a list of all Locations'
    
    getLocation:
        method: 'GET',
        url: '/admin/locations/#{id}.json',
        returns: 'location',
        description: 'Receive a single Location'
    
    getRedirects:
        method: 'GET',
        url: '/admin/redirects.json',
        returns: 'redirects',
        description: 'Receive a list of all Redirects'
    
    countRedirects:
        method: 'GET',
        url: '/admin/redirects/count.json',
        returns: 'count',
        description: 'Receive a count of all Redirects'
    
    getRedirect:
        method: 'GET',
        url: '/admin/redirects/#{id}.json',
        returns: 'redirect',
        description: 'Receive a single Redirect'
    
    createRedirect:
        method: 'POST',
        url: '/admin/redirects.json',
        returns: 'redirect',
        description: 'Create a new Redirect'
    
    modifyRedirect:
        method: 'PUT',
        url: '/admin/redirects/#{id}.json',
        returns: 'redirect',
        description: 'Modify an existing Redirect'
    
    removeRedirect:
        method: 'DELETE',
        url: '/admin/redirects/#{id}.json',
        description: 'Remove a Redirect from the database'
    
    getSmartCollections:
        method: 'GET',
        url: '/admin/smart_collections.json',
        returns: 'smart_collections',
        description: 'Receive a list of all SmartCollections'
    
    countSmartCollections:
        method: 'GET',
        url: '/admin/smart_collections/count.json',
        returns: 'count',
        description: 'Receive a count of all SmartCollections'
    
    getSmartCollection:
        method: 'GET',
        url: '/admin/smart_collections/#{id}.json',
        returns: 'smart_collection',
        description: 'Receive a single SmartCollection'
    
    createSmartCollection:
        method: 'POST',
        url: '/admin/smart_collections.json',
        returns: 'smart_collection',
        description: 'Create a new SmartCollection'
    
    modifySmartCollection:
        method: 'PUT',
        url: '/admin/smart_collections/#{id}.json',
        returns: 'smart_collection',
        description: 'Modify an existing SmartCollection'
    
    removeSmartCollection:
        method: 'DELETE',
        url: '/admin/smart_collections/#{id}.json',
        description: 'Remove a SmartCollection from the database'
    
    createCollect:
        method: 'POST',
        url: '/admin/collects.json',
        returns: 'collect',
        description: 'Create a new Collect'
    
    removeCollect:
        method: 'DELETE',
        url: '/admin/collects/#{id}.json',
        description: 'Remove a Collect from the database'
    
    getCollects:
        method: 'GET',
        url: '/admin/collects.json',
        returns: 'collects',
        description: 'Receive a list of all Collects'
    
    countCollects:
        method: 'GET',
        url: '/admin/collects/count.json',
        returns: 'count',
        description: 'Receive a count of all Collects'
    
    getCollect:
        method: 'GET',
        url: '/admin/collects/#{id}.json',
        returns: 'collect',
        description: 'Receive a single Collect'
    
    getUsers:
        method: 'GET',
        url: '/admin/users.json',
        returns: 'users',
        description: 'Receive a list of all Users'
    
    getUser:
        method: 'GET',
        url: '/admin/users/#{id}.json',
        returns: 'user',
        description: 'Receive a single User'
    
    getEvents:
        method: 'GET',
        url: '/admin/events.json',
        returns: 'events',
        description: 'Receive a list of all Events'
    
    getEvent:
        method: 'GET',
        url: '/admin/events/#{id}.json',
        returns: 'event',
        description: 'Receive a single Event'
    
    countEvents:
        method: 'GET',
        url: '/admin/events/count.json',
        returns: 'count',
        description: 'Receive a count of all Events'
    
    getFulfillments:
        method: 'GET',
        url: '/admin/orders/#{id}/fulfillments.json',
        returns: 'fulfillments',
        description: 'Receive a list of all Fulfillments'
    
    countFulfillments:
        method: 'GET',
        url: '/admin/orders/#{id}/fulfillments/count.json',
        returns: 'count',
        description: 'Receive a count of all Fulfillments'
    
    getFulfillment:
        method: 'GET',
        url: '/admin/orders/#{orderId}/fulfillments/#{id}.json',
        returns: 'fulfillment',
        description: 'Receive a single Fulfillment'
    
    createFulfillment:
        method: 'POST',
        url: '/admin/orders/#{id}/fulfillments.json',
        returns: 'fulfillment',
        description: 'Create a new Fulfillment'
    
    modifyFulfillment:
        method: 'PUT',
        url: '/admin/orders/#{orderId}/fulfillments/#{id}.json',
        returns: 'fulfillment',
        description: 'Modify an existing Fulfillment'
    
    completeFulfillment:
        method: 'POST',
        url: '/admin/orders/#{orderId}/fulfillments/#{id}/complete.json',
        returns: 'fulfillment',
        description: 'Complete a pending fulfillment'
    
    cancelFulfillment:
        method: 'POST',
        url: '/admin/orders/#{orderId}/fulfillments/#{id}/cancel.json',
        returns: 'fulfillment',
        description: 'Cancel a pending fulfillment'
    
    getRefund:
        method: 'GET',
        url: '/admin/orders/#{orderId}/refunds/#{id}.json',
        returns: 'refund',
        description: 'Receive a single Refund'
    
    getCustomCollections:
        method: 'GET',
        url: '/admin/custom_collections.json',
        returns: 'custom_collections',
        description: 'Receive a list of all CustomCollections'
    
    countCustomCollections:
        method: 'GET',
        url: '/admin/custom_collections/count.json',
        returns: 'count',
        description: 'Receive a count of all CustomCollections'
    
    getCustomCollection:
        method: 'GET',
        url: '/admin/custom_collections/#{id}.json',
        returns: 'custom_collection',
        description: 'Receive a single CustomCollection'
    
    createCustomCollection:
        method: 'POST',
        url: '/admin/custom_collections.json',
        returns: 'custom_collection',
        description: 'Create a new CustomCollection'
    
    modifyCustomCollection:
        method: 'PUT',
        url: '/admin/custom_collections/#{id}.json',
        returns: 'custom_collection',
        description: 'Modify an existing CustomCollection'
    
    removeCustomCollection:
        method: 'DELETE',
        url: '/admin/custom_collections/#{id}.json',
        description: 'Remove a CustomCollection from the database'
    
    getFulfillmentServices:
        method: 'GET',
        url: '/admin/fulfillment_services.json',
        returns: 'fulfillment_services',
        description: 'Receive a list of all FulfillmentServices'
    
    createFulfillmentService:
        method: 'POST',
        url: '/admin/fulfillment_services.json',
        returns: 'fulfillment_service',
        description: 'Create a new FulfillmentService'
    
    getFulfillmentService:
        method: 'GET',
        url: '/admin/fulfillment_services/#{id}.json',
        returns: 'fulfillment_service',
        description: 'Receive a single FulfillmentService'
    
    modifyFulfillmentService:
        method: 'PUT',
        url: '/admin/fulfillment_services/#{id}.json',
        returns: 'fulfillment_service',
        description: 'Modify an existing FulfillmentService'
    
    removeFulfillmentService:
        method: 'DELETE',
        url: '/admin/fulfillment_services/#{id}.json',
        description: 'Remove a FulfillmentService from the database'
    
    getCountries:
        method: 'GET',
        url: '/admin/countries.json',
        returns: 'countries',
        description: 'Receive a list of all Countries'
    
    countCountries:
        method: 'GET',
        url: '/admin/countries/count.json',
        returns: 'count',
        description: 'Receive a count of all Countries'
    
    getCountry:
        method: 'GET',
        url: '/admin/countries/#{id}.json',
        returns: 'country',
        description: 'Receive a single Country'
    
    createCountry:
        method: 'POST',
        url: '/admin/countries.json',
        returns: 'country',
        description: 'Create a new Country'
    
    modifyCountry:
        method: 'PUT',
        url: '/admin/countries/#{id}.json',
        returns: 'country',
        description: 'Modify an existing Country'
    
    removeCountry:
        method: 'DELETE',
        url: '/admin/countries/#{id}.json',
        description: 'Remove a Country from the database'
    
    createRisk:
        method: 'POST',
        url: '/admin/orders/#{id}/risks.json',
        returns: 'risk',
        description: 'Create a new Order Risks'
    
    getRisks:
        method: 'GET',
        url: '/admin/orders/#{id}/risks.json',
        returns: 'risks',
        description: 'Receive a list of all Order Risks'
    
    getRisk:
        method: 'GET',
        url: '/admin/orders/#{orderId}/risks/#{id}.json',
        returns: 'risk',
        description: 'Receive a single Order Risks'
    
    modifyRisk:
        method: 'PUT',
        url: '/admin/orders/#{orderId}/risks/#{id}.json',
        returns: 'risk',
        description: 'Modify an existing Order Risks'
    
    getProductImages:
        method: 'GET',
        url: '/admin/products/#{id}/images.json',
        returns: 'images',
        description: 'Receive a list of all Product Images'
    
    countProductImages:
        method: 'GET',
        url: '/admin/products/#{id}/images/count.json',
        returns: 'count',
        description: 'Receive a count of all Product Images'
    
    getProductImage:
        method: 'GET',
        url: '/admin/products/#{productId}/images/#{id}.json',
        returns: 'image',
        description: 'Receive a single Product Image'
    
    createProductImage:
        method: 'POST',
        url: '/admin/products/#{id}/images.json',
        returns: 'image',
        description: 'Create a new Product Image'
    
    modifyProductImage:
        method: 'PUT',
        url: '/admin/products/#{productId}/images/#{id}.json',
        returns: 'image',
        description: 'Modify an existing Product Image'
    
    removeProductImage:
        method: 'DELETE',
        url: '/admin/products/#{productId}/images/#{id}.json',
        description: 'Remove a Product Image from the database'

    # ScriptTags 
    getScriptTags:
        method: 'GET'
        url: '/admin/script_tags.json'
        description: 'Receive a list of all ScriptTags'
        returns: 'script_tags'

    countScriptTags:
        method: 'GET'
        url: '/admin/script_tags.count.json'
        returns: 'count'
        description: 'Receive a count of all ScriptTags'

    getScriptTag:
        method: 'GET'
        url: '/admin/script_tags/#{id}.json'
        returns: 'script_tag'
        description: 'Receive a single ScriptTag'

    createScriptTag:
        method: 'POST'
        url: '/admin/script_tags.json'
        returns: 'script_tag'
        description: 'Creates a new ScriptTag'

    modifyScriptTag:
        method: 'PUT'
        url: '/admin/script_tags/#{id}.json'
        returns: 'script_tag'
        description: 'Modify an existing ScriptTag'

    removeScriptTag:
        method: 'DELETE'
        url: '/admin/script_tags/#{id}.json'
        description: 'Removes an existing ScriptTag'

  Object.freeze ns.ApiMethods

  ns.ApiConcatMethods = 
    getAllOrders:
        count: 'countOrders'
        fetch: 'getOrders'

    getAllProducts:
        count: 'countProducts'
        fetch: 'getProducts'

    getAllProductMetafields:
        count: 'countProductMetafields'
        fetch: 'getProductMetafields'

    getAllCollects:
        count: 'countCollects'
        fetch: 'getCollects'

    getAllCustomers:
        count: 'countCustomers'
        fetch: 'getCustomers'

  Object.freeze ns.ApiConcatMethods

  return ['ApiMethods', ns.ApiMethods, 'ApiConcatMethods', ns.ApiConcatMethods]
  