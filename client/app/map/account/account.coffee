Template.accountIcon.helpers
  xScale: -> @scale
  yScale: -> if @reverse then -@scale else @scale
  strokeWidth: -> @strokeWidth / @scale
  negate: (x, b) -> if b then -x else x
  divide: (a, b) -> console.log(@);a/b


Template.account.helpers
  selected: -> "selected" if Session.equals("selected", @_id)
  balance: -> @balance || 0
  negative: -> @balance < 0
  iconScale: -> 1 + Math.log(Math.max(1, Math.abs(@balance))) * 0.2

Template.account.events
  "click .account": (e,tpl) ->
    Session.set("selected", @_id)
    false
  "dblclick .account": ->
    Router.go("account.show", _id: @_id)
    false

Template.account.events
  "mouseover .account": (e,tpl)->
    d3.select(e.currentTarget).classed("hover", true)
    Session.set("hovered", @_id)
  "mouseout .account": (e,tpl)->
    d3.select(e.currentTarget).classed("hover", false)
    Session.set("hovered", null)


Template.account.rendered = ->
  d3.select(@firstNode).call d3.behavior.drag().on("drag", =>
    Accounts.update @data._id, $inc: {x:d3.event.dx, y:d3.event.dy}
  ).on("dragstart", =>
    d3.select(@firstNode).classed("dragging", true)
  ).on("dragend", =>
    d3.select(@firstNode).classed("dragging", false)
  )



