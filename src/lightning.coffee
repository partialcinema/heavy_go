helper = require './helper'

NUMBER_OF_LIGHTNING_IMAGES = 28
# cache lightning images in dom
loadImages = ->
  n = 0
  while n <= NUMBER_OF_LIGHTNING_IMAGES
    img = document.createElement "img"
    img.src = "../img/lightning/lightning#{n}.png"
    body = $('body')[0]
    body.appendChild img
    n += 1

$ loadImages

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
