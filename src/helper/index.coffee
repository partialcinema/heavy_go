intervalIds = {}

unschedule = (key) ->
  intervalIds = intervalIds[key]
  clearInterval(id) for id in intervalIds

schedule = (updatesPerSecond, key, func) ->
  millisecondsBetweenUpdates = 1000 / updatesPerSecond
  intervalIds[key] ?= []
  intervalIds[key].push setInterval func, millisecondsBetweenUpdates

scheduleOnce = (updatesPerSecond, key) ->
  if !intervalIds[key]
    schedule arguments...

module.exports =
  schedule: schedule
  scheduleOnce: scheduleOnce
  unschedule: unschedule
