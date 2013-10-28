noflo = require 'noflo'

class BinaryNumber extends noflo.Component
  description: "Convert Bits to BinaryNumber"

  constructor: () ->
    @bits =
      '0': 0, '1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0, '7': 0,
      '8': 0, '9': 0, 'a': 0, 'b': 0, 'c': 0, 'd': 0, 'e': 0, 'f': 0

    @inPorts =
      '0': new noflo.Port, '1': new noflo.Port, '2': new noflo.Port, '3': new noflo.Port,
      '4': new noflo.Port, '5': new noflo.Port, '6': new noflo.Port, '7': new noflo.Port,
      '8': new noflo.Port, '9': new noflo.Port, 'a': new noflo.Port, 'b': new noflo.Port,
      'c': new noflo.Port, 'd': new noflo.Port, 'e': new noflo.Port, 'f': new noflo.Port
    @outPorts =
      out: new noflo.Port

    for bit, port of @inPorts
      do (bit) =>
        port.on "data", (data) =>
          @bits[bit] = data
          @update()

  update: ->
    states = (state for bit, state of @bits)
    value = states.reverse().join("")
    @outPorts.out.send(value)

exports.getComponent = -> new BinaryNumber()
