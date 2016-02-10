helper = require '../helper'
DrunkenWalk = require('../periodic/mth').DrunkenWalk

explode = (center, ItemConstructor) ->
  
  items = []
  
  randomOffset = new DrunkenWalk startingValue: 10, noiseAmplitude: 50, clamp: {min: -50, max: 50}
  randomDeltaAngle = new DrunkenWalk startingValue: 5 , noiseAmplitude: 10, clamp: {min: 5, max: 20}

  makeItem = (angle) ->
    offset = new paper.Point(
      length: randomOffset.next()
      angle: angle
    )
    
    speed = Math.random() * 50
    speed = Math.max(speed, 20)
    velocity = new paper.Point(
      length: speed
      angle: angle
    )

    drunkenCenter = center.add offset
    
    item = new ItemConstructor(drunkenCenter, angle)
    item.item.data.velocity = velocity
    items.push item
  
  move = (item) ->
    item.item.translate(item.item.data.velocity)
    unless view.bounds.intersects(item.item.bounds)
      item.item.remove()
      items.splice(items.indexOf(item), 1)

  moveItems = () ->
    move(item) for item in items

  angle = 0
  while angle < 360
    angle += randomDeltaAngle.next()
    makeItem(angle)
    
  helper.schedule 30, 'feathers', moveItems
 

module.exports = explode 
