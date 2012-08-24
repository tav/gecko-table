# Public Domain (-) 2012 The Gecko Table Authors.
# See the Gecko Table UNLICENSE file for details.

define 'table', (exports, root) ->

  XUL_NS = 'http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul'

  doc = root.document
  doc.$ = doc.getElementById

  inFullscreen = false
  exports.toggleFullscreen = ->
    if inFullscreen
      setTimeout(->
        root.fullScreen = inFullscreen = false
      , 1)
    else
      setTimeout(->
        root.fullScreen = inFullscreen = true
      , 1)
    return

  prev = elem = null
  prevLeft = prevTop = lastLeft = lastTop = 0

  exports.move = (direction) ->
    if not elem
      return
    # elem.position = 'absolute'
    if direction is 'l'
      lastLeft -= 30
      elem.left = lastLeft
    else if direction is 'r'
      lastLeft += 30
      elem.left = lastLeft
      # elem.left = lastLeft + "px"
    else if direction is 'u'
      lastTop -= 30
      elem.top = lastTop
      # elem.top = lastTop + "px"
    else if direction is 'd'
      lastTop += 30
      elem.top = lastTop
      # elem.top = lastTop + "px"
    return

  exports.newSheet = (id) ->
    [prevLeft, prevTop] = [lastLeft, lastTop]
    lastLeft = lastTop = 0
    elem = doc.createElementNS XUL_NS, 'browser'
    elem.type = 'content' # content / -primary / -targetable / chrome
    elem.setAttribute 'src', 'http://www.google.com/'
    elem.flex = 1
    $parent = doc.$ id
    $parent.width = '500px'
    $parent.height = '500px'
    $parent.appendChild elem

  exports.newSheet = () ->
    prev = elem
    lastLeft = lastTop = 0
    elem = doc.createElementNS XUL_NS, 'browser'
    elem.type = 'content-targetable' # content / -primary / -targetable / chrome
    elem.setAttribute 'src', 'http://www.google.com/'
    elem.width = '500px'
    elem.height = '500px'
    $parent = doc.$ 'sheets'
    $parent.appendChild elem

  exports.swap = () ->
    temp = prev
    prev = elem
    elem = temp
    temp = prevLeft
    prevLeft = lastLeft
    lastLeft = temp
    temp = prevTop
    prevTop = lastTop
    lastTop = temp

  exports.sayHello = ->
    # window.document.location = "http://www.google.com/"
    alert 'Hi there!'

  return