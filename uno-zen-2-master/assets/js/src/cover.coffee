'use strict'

$ ->

  isOpen = location.hash is '#open'

  _animate = ->
    setTimeout(->
      $('.cover').addClass 'animated'
    , 1000)

  _expand = (options)->
    $('main, .cover, .links > li').toggleClass 'expanded'
    Uno.search.form options.form

  $('#menu-button').click ->
    $('.cover, main, #menu-button').toggleClass 'expanded'

  $('.nav-blog > a, #avatar-link').click (event) ->
    if Uno.is 'page', 'home'
      event.preventDefault()
      location.hash = if location.hash is '' then '#open' else ''
      return $('#menu-button').trigger 'click' unless Uno.is 'device', 'desktop'
      _expand form: 'toggle'

  if (Uno.is 'device', 'desktop') and (Uno.is 'page', 'home')
    _animate()
    _expand form: 'hide' if !isOpen
