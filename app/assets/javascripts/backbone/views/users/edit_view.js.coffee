Backboneapp.Views.Users ||= {}

class Backboneapp.Views.Users.EditView extends Backbone.View
  template : JST["backbone/templates/users/edit"]

  events :
    "submit #edit-user" : "update"
    "blur #name" : "raise_name_error"
    "blur #email" : "raise_email_error"    

  raise_name_error: ->
    if $("#name").val()
      $("#name_error").text ""
    else
      $("#name_error").text "can't be blank"
      

  raise_email_error: ->
    if $("#email").val()
      $("#email_error").text ""
    else
      $("#email_error").text "can't be blank"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (user) =>
        @model = user
        window.location.hash = "/#{@model.id}"

      error: (user, jqXHR) =>

       if jQuery.parseJSON(jqXHR.responseText).name
	       $("#name_error").text (jQuery.parseJSON(jqXHR.responseText).name)
       else
	       $("#name_error").text ""       
	       
       if jQuery.parseJSON(jqXHR.responseText).email
	       $("#email_error").text (jQuery.parseJSON(jqXHR.responseText).email)
       else
	       $("#email_error").text ""       
   
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
