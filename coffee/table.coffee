# Public Domain (-) 2012 The Gecko Table Authors.
# See the Gecko Table UNLICENSE file for details.

define 'table', (exports, root) ->

  doc = window.document
  doc.$ = doc.getElementById

  exports.sayHello = ->
    alert 'Hi there!'
