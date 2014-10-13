Session.setDefault("language", "hu")
Deps.autorun ->
  TAPi18n.setLanguage(Session.get("language"))

