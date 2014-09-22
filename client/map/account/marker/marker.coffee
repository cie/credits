Template.marker.rendered = ->
  d3.select(@firstNode).call d3.behavior.drag().on("drag", =>
    console.log(d3.event.x, d3.event.y)
  )

Interactions.hover(Template.marker, ".marker")
