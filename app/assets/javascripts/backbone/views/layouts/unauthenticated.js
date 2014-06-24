Backboneapp.Views.Layouts.Unauthenticated = Backbone.Marionette.Layout.extend({
  template: 'layouts/unauthenticated',
  regions: {
    tabContent: '#tab-content'
  },

  views: {},

  events: {
    'click ul.nav-tabs li a': 'switchViews'
  },

  onShow: function() {
    this.views.login = Backboneapp.Views.Unauthenticated.Login;
    this.views.signup = Backboneapp.Views.Unauthenticated.Signup;
    this.views.retrievePassword = Backboneapp.Views.Unauthenticated.RetrievePassword;
    this.tabContent.show(new this.views.login);
  },

  switchViews: function(e) {
    e.preventDefault();
    this.tabContent.show(new this.views[$(e.target).data('content')]);
  }

});

Backboneapp.addInitializer(function() {
  Backboneapp.layouts.unauthenticated = new Backboneapp.Views.Layouts.Unauthenticated();
});
