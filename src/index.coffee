Feather = require './items/feather'
motion = require './motion'
explosions = require './effects/explode'
periodic = require './periodic'

randomInterval = (min, max) ->
  return Math.floor(Math.random() * max) + min

isNaked = false
toggleOwl = ->
  if isNaked
    newClassName = 'visible owl1 scene'
  else
    newClassName = 'visible naked-owl scene'
  document.querySelector("#owl").className = newClassName
  isNaked = not isNaked

n = 1
danceState = () ->
  n += 1
  n = n % 4

toggleOwlDance = ()->
  unless isNaked
    newClassName = "visible owl#{danceState()} scene"
    document.querySelector("#owl").className = newClassName


window.onload = () ->
  # Set up paper.js
  paper.install window
  paper.setup 'canv'

  project.currentStyle.strokeColor = 'black'
  project.currentStyle.strokeWidth = 5
  tool = new Tool()
  center = new Point(view.center)
  explosions.buildCache()
  document.querySelector("#owl").className += ' visible'

  
  tool.onMouseDown = (ev) ->
    toggleOwl()
    owlPoint = new paper.Point(view.size.width * 0.53, view.size.height * 0.57)
    explosions.explode(owlPoint, Feather) for x in [1...20]

  i = 0
  view.onFrame = () ->
    skip = (i % 2) is 0
    i += 1
    return if skip

    view.update()

  tool.onKeyDown = (event) ->
    if event.key is 'd'
      toggleOwlDance()


  tool.onMouseMove = (event) ->
    null
