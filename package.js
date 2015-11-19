Package.describe({
  name: 'codefabric:meteor-shopify-app',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: '',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');
  api.use(['ecmascript', 
           'coffeescript',
           'check',
           'mongo',
           'underscore',
           'http',
           'mizzao:build-fetcher@0.3.0',
           'jparker:crypto-core',
           'jparker:crypto-sha256',
           'jparker:crypto-hmac',
           'codefabric:meteor-common',
           'codefabric:meteor-shopify'], 
          ['client', 'server']);

  // *** Standard CodeFabric Structure *** //

  api.imply('codefabric:meteor-common');
  api.export('CodeFabric', ['client', 'server']);

  api.addFiles([
    'global_namespaces.js',
    'lib/namespaces.coffee',
  ], ['client', 'server']);

  api.addFiles([
    'client/namespaces.coffee'
  ], ['client']);

  api.addFiles([
    'server/namespaces.coffee'
  ], ['server']);

  // *** Package Files *** //

  api.addFiles([
    'lib/constants.coffee',
    'lib/shopifyApiMethods.coffee',
    'lib/shopifyApiBase.coffee',
    'lib/shopifyAppBase.coffee',
    'lib/models/shop.coffee',
    'lib/collections/shops.coffee',
  ], ['client', 'server'])

  api.addFiles([
    'client/redirector.coffee',
    'client/redirectors/pageRedirector.coffee',
    'client/redirectors/iFrameRedirector.coffee',
    'client/shopifyApi.coffee',
    'client/shopifyApp.coffee',
    'client/lib/shopifyESDKView.coffee'
  ], ['client']);

  api.addFiles([
    'client/lib/shopify-esdk.fetch.json'
  ], ['client']);

  api.addFiles([
    'server/publications/shops.coffee',
    'server/shopifyScopes.coffee',
    'server/shopifyApi.coffee',
    'server/shopifyApp.coffee'
  ], ['server']);
});

// Package.onTest(function(api) {
//   api.versionsFrom('1.2.1');
//   api.use(['ecmascript',
//            'coffeescript',
//            'tinytest',
//            'mizzao:build-fetcher@0.3.0',
//            'mongo']);
//   api.use('codefabric:meteor-shopify-app');

//   api.addFiles('tests/client/tests.coffee', 'client');
//   api.addFiles('tests/server/tests.coffee', 'server');
//});
