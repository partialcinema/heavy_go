IrregularPolygon = require './items/irregular-polygon'
ChainLink = require './items/chain-link'
Grass = require './items/grass'
motion = require './motion'
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

  tool.onMouseDown = () ->
    null

  i = 0
  view.onFrame = () ->
    skip = (i % 2) is 0
    i += 1
    return if skip

    view.update()

  tool.onKeyDown = (event) ->
    if event.key is 'g' #spawn grass

  tool.onMouseMove = (event) ->
    null
