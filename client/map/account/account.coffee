Template.accountIcon.helpers
  positive: -> @balance > 0
  negative: -> @balance < 0
  zero: -> @balance is 0 || !@balance # FIXME remove the ||... part 
  iconScale: -> 1 + Math.log(Math.max(1, Math.abs(@balance))) * 0.2

Template.account.helpers
  selected: -> "selected" if Session.equals("selected", @_id)
  balance: -> @balance || 0

Template.account.events
  "click .account": (e,tpl) ->
    Session.set("selected", @_id)
    false

Interactions.hover(Template.account, ".account")

Template.account.rendered = ->
  d3.select(@firstNode).call d3.behavior.drag().on("drag", =>
    Accounts.update @data._id, $inc: {x:d3.event.dx, y:d3.event.dy}
  ).on("dragstart", =>
    d3.select(@firstNode).classed("dragging", true)
  ).on("dragend", =>
    d3.select(@firstNode).classed("dragging", false)
  )



