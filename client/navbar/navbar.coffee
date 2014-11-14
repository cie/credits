Template.navbar.helpers
  languages: -> {id: k, name: v.name} for k,v of TAPi18n.getLanguages()
  language: ->
    id = TAPi18n.getLanguage()
    name = TAPi18n.getLanguages()[id].name
    {id, name}
  user: -> Meteor.user()
  userName: -> Meteor.user().emails[0].address

Template.navbar.events
  "click [data-select-language]": ->
    TAPi18n.setLanguage(@id)
  "click [data-logout]": ->
    Meteor.logout()
  "keypress [data-login]": (e) ->
    if e.which is 13
      Meteor.loginWithPassword e.target.form.username.value, e.target.form.password.value
