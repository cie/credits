@Interactions =

  # Hovering over an element matching selector will attach a .hover class on it
  hover: (template, selector) ->
    map = {}
    map["mouseover #{selector}"] = (e,tpl)->
      d3.select(e.currentTarget).classed("hover", true)
    map["mouseout #{selector}"] = (e,tpl)->
      d3.select(e.currentTarget).classed("hover", false)
    template.events(map)


