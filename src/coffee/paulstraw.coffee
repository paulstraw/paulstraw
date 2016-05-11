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

$.Velocity.RegisterEffect 'bounce',
  defaultDuration: 200,
  calls: [
    [{translateY: -6}]
    [{translateY: 0}]
    [{translateY: -6}]
    [{translateY: 0}]
  ]


ready = ->
  $('.hidey').css(opacity: 0)

loaded = ->
  workEl = $('.work')

  $('.initial').velocity('slideDownInRotate', {stagger: 450})

  setTimeout ->
    $('.secondary').velocity('slideDownIn', {stagger: 450})
  , 1000

  $('.twitter-link').on 'mouseenter', ->
    $(this).velocity('bounce');


  $('li').on 'mouseenter', ->
    el = $(this)
    hoverEls = el.find('.hover')
    hoverEls.velocity('rotatey', {stagger: hoverEls.length * 2})

document.addEventListener('DOMContentLoaded', ready)
window.onload = loaded
