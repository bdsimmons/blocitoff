$ ->
  @timer = window.setTimeout =>
    $(".drawer--container").toggleClass("drawer--container--open")
  , 2000

  $(".js-toggle").click =>
    window.clearTimeout(@timer)
    $(".drawer--container").toggleClass("drawer--container--open")