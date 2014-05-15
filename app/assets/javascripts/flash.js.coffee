$ ->
  $flash = $(".alert.flash")
  setTimeout (->
    $flash.slideUp() if $flash
    return
  ), 5000
  return