loadImages = (imageName, numberOfImages) ->
  n = 0
  while n < numberOfImages
    path = "../img/#{imageName}/#{imageName}#{n}.png"
    loadImage path
    n += 1

loadImage = (path) ->
  img = document.createElement "img"
  img.src = "../img/#{path}"
  img.className = "invisible"
  body = $('body')[0]
  body.appendChild img
  img

module.exports =
  image: loadImage
  images: loadImages
