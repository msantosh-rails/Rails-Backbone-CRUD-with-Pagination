Backboneapp.Views.Layouts.Main = Backbone.Marionette.Layout.extend({
  template: 'layouts/main',
  regions: {
    content: '#content'
  }
});

Backboneapp.addInitializer(function() {
  Backboneapp.layouts.main = new Backboneapp.Views.Layouts.Main();
});
