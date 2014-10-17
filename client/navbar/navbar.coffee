Template.navbar.helpers
  languages: -> {id: k, name: v.name} for k,v of TAPi18n.getLanguages()
  language: ->
    id = TAPi18n.getLanguage()
    name = TAPi18n.getLanguages()[id].name
    {id, name}

Template.navbar.events
  "click [data-select-language]": ->
    TAPi18n.setLanguage(@id)
