helper = require './helper'
load = require './load'

spawn = (start, end) ->
  skull = new paper.Raster 'skull'
  skull.position = start
  skull.scale 5
  trajectory = end.subtract start
  proportion = 0.1
  travel = ->
    skull.position = start.add trajectory.multiply proportion
    proportion += 0.1
    skull.scale 0.85
  helper.schedule 20, 'skull', travel

skull = load.image "skull.png"
skull.id = "skull"

module.exports.spawn = spawn
