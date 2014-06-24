Backboneapp = new Backbone.Marionette.Application();

Backboneapp.Views = {};
Backboneapp.Views.Layouts = {};
Backboneapp.Models = {};
Backboneapp.Collections = {};
Backboneapp.Routers = {};
Backboneapp.Helpers = {};

// Instantiated global layouts
Backboneapp.layouts = {};

Backboneapp.addRegions({
  main: '#main'
});

Backboneapp.vent.on("authentication:logged_in", function() {
  Backboneapp.main.show(Backboneapp.layouts.main);
});

Backboneapp.vent.on("authentication:logged_out", function() {
  Backboneapp.main.show(Backboneapp.layouts.unauthenticated);
});

Backboneapp.bind("initialize:after", function() {
  if(Backboneapp.currentUser) {
    Backboneapp.vent.trigger("authentication:logged_in");
  }
  else {
    Backboneapp.vent.trigger("authentication:logged_out");
  }
});

// TODO: Routers and history start
// Backboneapp.vent.on("layout:rendered", function() {
//   Backbone.history.start({pushState: true});
// });
