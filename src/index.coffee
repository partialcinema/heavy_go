Feather = require './items/feather'
motion = require './motion'
explosions = require './effects/explode'
periodic = require './periodic'
lightning = require './lightning'
owl = require './owl'
skull = require './skull'

randomInterval = (min, max) ->
  return Math.floor(Math.random() * max) + min

isNaked = false
toggleOwl = ->
  if isNaked
    newBackground = "url(../img/owl/owl1.png"
  else
    newBackground = "url(../img/owl/naked-owl.png"
  $('#owl').css "background-image", newBackground
  isNaked = not isNaked

isClear = false
toggleBackground = ->
  if isClear
    newBackground = "url(../img/background.png)"
  else
    newBackground = "url(../img/skyless-background.png)"
  $('.background').css "background-image", newBackground
  isClear = not isClear

n = 1
danceState = () ->
  n += 1
  n = n % 4
toggleOwlDance = ()->
  unless isNaked
    newBackground = "url(../img/owl/owl#{danceState()}.png"
    $('#owl').css "background-image", newBackground

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
    if isNaked
      lightning.flash()
      setTimeout toggleOwl, 500
      #setTimeout toggleBackground, 500
    else
      owlPoint = new paper.Point(view.size.width * 0.53, view.size.height * 0.57)
      skull.spawn ev.point, owlPoint
      explosions.explode(owlPoint, Feather) for x in [1...20]
      toggleOwl()
      #toggleBackground()


  i = 0
  view.onFrame = () ->
    skip = (i % 2) is 0
    i += 1
    return if skip

    view.update()

  tool.onKeyDown = (event) ->
    if event.key is 'd'
      toggleOwlDance()

    if event.key is 'b'
      toggleBackground()

  tool.onMouseMove = (event) ->
    #TESTING SSH
    null
