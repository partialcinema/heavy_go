Feather = require './items/feather'
motion = require './motion'
explosions = require './effects/explode'
periodic = require './periodic'

randomInterval = (min, max) ->
  return Math.floor(Math.random() * max) + min

window.onload = () ->
  # Set up paper.js
  paper.install window
  paper.setup 'canv'

  project.currentStyle.strokeColor = 'black'
  project.currentStyle.strokeWidth = 5
  tool = new Tool()
  center = new Point(view.center)
  explosions.buildCache()

  tool.onMouseDown = (ev) ->
    explosions.explode(ev.point, Feather) for x in [1...10]

  i = 0
  view.onFrame = () ->
    skip = (i % 2) is 0
    i += 1
    return if skip

    view.update()

  tool.onKeyDown = (event) ->

  tool.onMouseMove = (event) ->
    null
