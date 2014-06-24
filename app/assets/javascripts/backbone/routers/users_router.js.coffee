class Backboneapp.Routers.UsersRouter extends Backbone.Router
  initialize: (options) ->
    @users = new Backboneapp.Collections.UsersCollection()
    @users.reset options.users

  routes:
    "new"      : "newUser"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newUser: ->
    @view = new Backboneapp.Views.Users.NewView(collection: @users)
    $("#grid").html(@view.render().el)
    $("#users").html("")
    $("#paginator").html("")    
    print_country("country")

  index: ->
#    model = new Backboneapp.Models.User()
    @view = new Backboneapp.Views.Users.IndexView(users: @users)
    $("#users").html(@view.render().el)

    #@view.fetch data:
     # page: page
    #model.fetch data: { page: page }
#    model.fetch success: ->
#      page: page

  show: (id) ->
    user = @users.get(id)

    @view = new Backboneapp.Views.Users.ShowView(model: user)
    $("#grid").html(@view.render().el)
    $("#users").html("")
    $("#paginator").html("")    

  edit: (id) ->
    user = @users.get(id)
    @view = new Backboneapp.Views.Users.EditView(model: user)
    $("#grid").html(@view.render().el)
    $("#users").html("")
    $("#paginator").html("")    

    print_selected_country("country")
    index = $("#country :selected").index()
    print_selected_state('state', index)
    
