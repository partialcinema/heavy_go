Feather = (center, angle) ->

  item = new Path.Ellipse(
    center: center
    radius: [90, 40]
    fillColor: 'black'
  )
  
  item.rotation = angle
  item.selected = true
  
  offset = item.length / 2
  tangent = item.getTangentAt(offset).multiply(50)
  tangent = tangent.rotate -90, item.segments[2]
  item.segments[2].point = item.segments[2].point.add(tangent)

  view.update()
  this

module.exports = Feather
