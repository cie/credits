Template.editAccount.helpers
  currency: "Ft"

Template.editAccount.events
  "click [on-click=closePopup]": ->
    Router.go "home"

  "click .name": (e, tpl)->
    tpl.$(".name").attr("contenteditable", "true").focus().select()
  "keypress .name, blur .name": (e, tpl) ->
    if e.which is 13  # enter
      Accounts.update @_id, $set: name: tpl.$(".name").text().trim()
      tpl.$(".name").attr("contenteditable", null)
      false

    
  "click .sum": (e, tpl)->
    tpl.$(".sum").attr("contenteditable", "true").focus().select()
  "keypress .sum, blur .sum": (e, tpl) ->
    if e.which is 13  # enter
      Accounts.update @_id, $set: balance: +tpl.$(".sum").text().trim()
      tpl.$(".sum").attr("contenteditable", null)
      false
    
