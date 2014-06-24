Backboneapp.Views.Users ||= {}

class Backboneapp.Views.Users.UserView extends Backbone.View
  template: JST["backbone/templates/users/user"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    response=confirm "Are you Sure"
    if response
      @model.destroy()
      this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
