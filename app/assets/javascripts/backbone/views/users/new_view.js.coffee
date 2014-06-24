Backboneapp.Views.Users ||= {}

class Backboneapp.Views.Users.NewView extends Backbone.View
  template: JST["backbone/templates/users/new"]

  events:
    "submit #new-user": "save"
    "blur #name" : "raise_name_error"
    "blur #email" : "raise_email_error"    
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

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
          
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (user) =>
        @model = user
        window.location.hash = "/#{@model.id}"

      error: (user, jqXHR) =>
       #@model.set({errors: $.parseJSON(jqXHR.responseText)})
#       alert((jQuery.parseJSON(jqXHR.responseText).name))
       if jQuery.parseJSON(jqXHR.responseText).name
	       $("#name_error").text (jQuery.parseJSON(jqXHR.responseText).name)
       else
	       $("#name_error").text ""       
	       
       if jQuery.parseJSON(jqXHR.responseText).email
	       $("#email_error").text (jQuery.parseJSON(jqXHR.responseText).email)
       else
	       $("#email_error").text ""       

    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
