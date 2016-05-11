$.Velocity.RegisterEffect 'rotatey',
  defaultDuration: 450
  calls: [
    [{rotateZ: -3, scale: 1.2}, 0.2]
    [{rotateZ: 3}, 0.2]
    [{rotateZ: -3}, 0.2]
    [{rotateZ: 3}, 0.2]
    [{rotateZ: -3}, 0.2]
    [{rotateZ: 0, scale: 1.0}, 0.2]
  ]

$.Velocity.RegisterEffect 'slideDownIn',
  defaultDuration: 1200
  calls: [
      [{opacity: [1, 0], translateY: [0, -40] }]
  ]

$.Velocity.RegisterEffect 'slideDownInRotate',
  defaultDuration: 900
  calls: [
      [{opacity: [1, 0], translateY: [0, -20], rotateX: [0, 10] }]
  ]

$.Velocity.RegisterEffect 'slideUpInRotate',
  defaultDuration: 900
  calls: [
      [{opacity: [1, 0], translateY: [0, 20], rotateX: [0, -10] }]
  ]

ready = ->
  $('.hidey').css(opacity: 0)

  # messing with some hue rotation stuff
  # doc = $(document)
  # win = $(window)
  # docHeight = doc.height()
  # winHeight = win.height()
  # rotators = $('.hue')

  # $(window).on 'resize', ->
  #   docHeight = doc.height()
  #   winHeight = win.height()


  # doc.on 'scroll touchmove', ->
  #   scrollOff = window.scrollY
  #   rot = (scrollOff + (winHeight / scrollOff)) / docHeight * 360
  #   console.log rot
  #   rotators.css '-webkit-filter', "hue-rotate(#{rot}deg)"

loaded = ->
  workEl = $('.work')

  $('.initial').velocity('slideDownInRotate', {stagger: 450})
  # workEl.css display: 'none'

  setTimeout ->
    $('.secondary').velocity('slideDownIn', {stagger: 450})
    # workEl.css display: 'block'
    # workEl.find('li').velocity('slideDownInRotate', {stagger: 360})
  , 1000


  $('li').on 'mouseenter', ->
    el = $(this)
    hoverEls = el.find('.hover')
    hoverEls.velocity('rotatey', {stagger: hoverEls.length * 2})

document.addEventListener('DOMContentLoaded', ready)
window.onload = loaded
