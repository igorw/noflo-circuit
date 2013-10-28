Gate = require('./Gate').Gate

exports.getComponent = ->
  new Gate((a, b) -> a && !b || b && !a)
