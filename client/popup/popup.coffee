Router.map ->
  @route "account",
    path: "/accounts/:_id"
    template: "page"
    data: ->
      popupContent: Template.editAccount
      account: Accounts.findOne(@params._id)

Template.popup.events
  "click .overlay": ->
    Router.go "home"


