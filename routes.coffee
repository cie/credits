Router.route "/", ->
  @render "welcome"

Router.route "/app", ->
  @render "app"
