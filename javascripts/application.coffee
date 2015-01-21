---
---

navHeight = $('nav').outerHeight()
navTop = $('header').outerHeight()

$('nav a').on 'click', ->
  navHeight = $('nav').outerHeight()
  scrollAnchor = $(this).data 'scroll'
  scrollPoint = $("section[data-anchor='#{scrollAnchor}']").offset().top - navHeight
  $('body,html').animate(
    scrollTop: scrollPoint
  , 500)
  return false

$(window).scroll( ->
  windscroll = $(window).scrollTop()
  if windscroll >= navTop
    $('nav').addClass('fixed')
    $('section').each (i) ->
      if $(this).position().top <= windscroll - navHeight
        $('nav a.active').removeClass 'active'
        $('nav a').eq(i).addClass 'active'
  else
    $('nav').removeClass 'fixed'
    $('nav a.active').removeClass 'active'
    $('nav a:first').addClass 'active'
).scroll()
