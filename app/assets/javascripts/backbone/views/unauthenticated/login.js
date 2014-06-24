Backboneapp.Views.Unauthenticated = Backboneapp.Views.Unauthenticated || {};

Backboneapp.Views.Unauthenticated.Login = Backbone.Marionette.ItemView.extend({
  template: 'unauthenticated/login',

  events: {
    'submit form': 'login'
  },

  initialize: function() {
    this.model = new Backboneapp.Models.UserSession();
    this.modelBinder = new Backbone.ModelBinder();
  },

  onRender: function() {
    this.modelBinder.bind(this.model, this.el);
  },

  login: function(e) {

    var self = this,
        el = $(this.el);

    e.preventDefault();

    el.find('input.btn-primary').button('loading');
    el.find('.alert-error').remove();

    this.model.save(this.model.attributes, {
      success: function(userSession, response) {
        el.find('input.btn-primary').button('reset');
        Backboneapp.currentUser = new Backboneapp.Models.User(response);
        Backboneapp.vent.trigger("authentication:logged_in");
      },
      error: function(userSession, response) {
        var result = $.parseJSON(response.responseText);
        el.find('form').prepend(Backboneapp.Helpers.Notifications.error(result.error));
        el.find('input.btn-primary').button('reset');
      }
    });

  }

});
