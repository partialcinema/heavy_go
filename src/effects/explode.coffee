helper = require '../helper'

explode = (center, ItemConstructor) ->
  
  items = []

  makeItem = (angle) ->
    velocity = new paper.Point(
      length: 20
      angle: angle
    )
    item = new ItemConstructor(center, angle)
    item.item.data.velocity = velocity
    items.push item
  
  move = (item) ->
    item.item.translate(item.item.data.velocity)
    unless view.bounds.intersects(item.item.bounds)
      item.item.remove()
      items.splice(items.indexOf(item), 1)

  moveItems = () ->
    move(item) for item in items

  makeItem(angle) for angle in [0..360] by 10
  helper.schedule 30, 'feathers', moveItems  
 

module.exports = explode 
