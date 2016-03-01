helper = require './helper'
load = require './load'
NUMBER_OF_LIGHTNING_IMAGES = 18
load.images 'lightning', NUMBER_OF_LIGHTNING_IMAGES

currentFrame = 0
update = ->
  if currentFrame > NUMBER_OF_LIGHTNING_IMAGES
    newBackground = ''
    helper.unschedule 'lightning'
    currentFrame = 0
    $('#lightning').css 'pointer-events', ''
  else
    newBackground = "url(../img/lightning/lightning#{currentFrame}.png"
    $('#lightning').css 'pointer-events', 'auto'
  $('#lightning').css "background-image", newBackground
  currentFrame += 1

flash = ->
  helper.schedule 15, 'lightning', update

module.exports =
  flash: flash
