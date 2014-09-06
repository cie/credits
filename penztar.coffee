if Meteor.isClient
  Template.balls.helpers
    balls: -> Balls.find()
    ballsHeight: -> 610
    mode: -> Session.get("mode")
    dragging: -> Session.get("dragged")?
    translate: -> Session.get("translate")
    scale: -> Session.get("scale")

  Template.balls.rendered = ->
    d3.select(@firstNode).call d3.behavior.zoom().on("zoom", =>
      Session.set "translate", d3.event.translate
      Session.set "scale", d3.event.scale
    ).translate(Session.get("translate") ? [0,0]).scale(Session.get("scale") ? 1)


  Template.ball.rendered = ->
    d3.select(@firstNode).call d3.behavior.drag().on("drag", =>
      Balls.update @data._id, $inc: {x:d3.event.dx, y:d3.event.dy}
    )


  Template.navbar.helpers
    activeMode: (mode) -> "active" if Session.equals("mode", mode)

  Template.navbar.events
    "mousedown a[data-mode]": (e)->
      Session.set("mode", $(e.target).attr("data-mode"))
