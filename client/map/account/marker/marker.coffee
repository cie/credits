Template.marker.rendered = ->
  d3.select(@firstNode).call d3.behavior.drag().origin(=>@data).on("drag", =>
    {x,y} = d3.event
    x += 3.5
    y += -4
    Session.set("transactionDrag", [x, y])
    Session.set("transactionDragSource", [@data.x, @data.y])
  ).on("dragend", =>
    targetId = Session.get("hovered")
    if targetId
      target = Accounts.findOne(targetId)
      alert(target.name)

    Session.set("transactionDrag", null)
  )

Interactions.hover(Template.marker, ".marker")
