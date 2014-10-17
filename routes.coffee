Router.route "/", ->
  if !Meteor.user()
    @render "welcome"
    return
  @render "app"
, name: "home"

  
Router.route "/accounts/:_id", ->
  @render "app",
    data: ->
      popupContent: Template.editAccount
      account: Accounts.findOne(@params._id)
, name: "account.show"
