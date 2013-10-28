noflo = require 'noflo'

class Gate extends noflo.Component
  description: "Abstract Binary Gate"

  constructor: (op) ->
    @a = 0
    @b = 0
    @op = op

    @inPorts =
      a: new noflo.Port
      b: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.a.on "data", (data) =>
      @a = parseInt(data, 10)
      @update()

    @inPorts.b.on "data", (data) =>
      @b = parseInt(data, 10)
      @update()

  update: ->
    value = if @op(@a, @b) then 1 else 0
    @outPorts.out.send(value)

exports.Gate = Gate
