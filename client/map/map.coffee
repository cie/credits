
Session.setDefault("translate", [0,0])
Session.setDefault("scale", 1)

Template.map.helpers
  accounts: -> Accounts.find()
  translate: -> Session.get("translate")
  scale: -> Session.get("scale")

Template.map.rendered = ->
  d3.select(@firstNode).call d3.behavior.zoom().on("zoom", =>
    Session.set "translate", d3.event.translate
    Session.set "scale", d3.event.scale
  ).translate(Session.get("translate") ? [0,0]).scale(Session.get("scale") ? 1)
    .on("dblclick.zoom", null)

Template.map.events
  "dblclick .map": (e) ->
    t = Session.get("translate")
    s = Session.get("scale")
    _id = Accounts.insert
      x: (e.offsetX-t[0])/s
      y:(e.offsetY-t[1])/s
      balance: 0
      color: d3.hsl(Math.random()*360, 0.7, 0.8).toString()
      name: randomName()

    Session.set("selected", _id)
  "click .map":
    Session.set("selected", null)


randomLetters="qwertzuiopasdfghjklyxcvbnmáéabcdefghijklmnopqrstuvwxyztátátétatatututirororururararirihihihahahohohuhuhühü"
randomName = ->
  randomLetters.substr(Math.random()*(randomLetters.length-5), 5)
