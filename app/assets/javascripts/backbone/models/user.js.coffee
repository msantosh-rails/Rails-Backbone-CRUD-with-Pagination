class Backboneapp.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    name: null
    email: null
    street: null
    city: null
    country: null
    state: null
    phone: null
    
#  validate: (attrs, options) ->
#    return {msg: "Email is not valid"} unless attrs.email
    
#  validate: (attrs) ->
#    return "Please fill name field."  unless attrs.name
#     if _.isEmpty(attrs.name)
#       $("#name_error").text "This Field is Required"
#    if _.isEmpty(attrs.name)
#      $("#name_error").text "This Field is Required"
#      return true
#    else if _.isEmpty(attrs.email)
#      $("#email_error").text "This Field is Required"
#      return true
      

#    if _.isEmpty(attrs.email)
#      $("#email_error").text "This Field is Required"
#    else
#      $("#email_error").text ""
#      return false

#    $("#email_error").text("This Field is Required")  unless attrs.email
        
class Backboneapp.Collections.UsersCollection extends Backbone.Collection
  model: Backboneapp.Models.User
  
  url: '/users'
  


