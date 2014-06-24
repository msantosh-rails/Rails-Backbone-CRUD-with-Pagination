Backboneapp.Helpers.FormHelpers = {};

Backboneapp.Helpers.FormHelpers.fieldHelp = function(message) {
  return HandlebarsTemplates['templates/shared/form_field_help']({
    'message': message
  });
};
