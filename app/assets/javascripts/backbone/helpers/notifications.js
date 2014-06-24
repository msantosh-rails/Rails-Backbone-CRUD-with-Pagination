Backboneapp.Helpers.Notifications = {};

Backboneapp.Helpers.Notifications.alert = function(alertType, message) {
  return HandlebarsTemplates['templates/shared/notifications']({
    'alertType': alertType,
    'message': message
  });
};

Backboneapp.Helpers.Notifications.error = function(message) {
  return this.alert('error', message);
};

Backboneapp.Helpers.Notifications.success = function(message) {
  return this.alert('success', message);
};

Handlebars.registerHelper('notify_error', function(msg) {
  msg = Handlebars.Utils.escapeExpression(msg);
  return new Handlebars.SafeString(Backboneapp.Helpers.Notifications.error(msg));
});

Handlebars.registerHelper('notify_success', function(msg) {
  msg = Handlebars.Utils.escapeExpression(msg);
  return new Handlebars.SafeString(Backboneapp.Helpers.Notifications.success(msg));
});
