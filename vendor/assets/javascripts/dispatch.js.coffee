# Globalize DISPATCH
window.DISPATCH = {}

# Setup controller/action dispatch
DISPATCH.exec = (controller, action) ->
  action = (if (action is `undefined`) then "default" else action)
  DISPATCH.ns[controller][action]() if controller isnt "" and DISPATCH.ns[controller] and typeof DISPATCH.ns[controller][action] is "function"

DISPATCH.init = ->
  body = document.body
  controller = body.getAttribute("data-controller")
  action = body.getAttribute("data-action")
  DISPATCH.exec "common"
  DISPATCH.exec controller
  DISPATCH.exec controller, action

DISPATCH.ns = window.APP = {}
$(document).ready DISPATCH.init