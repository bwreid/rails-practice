class Welcome
  # USING AN @ BEFORE A FUNCTION MAKES IT A CLASS METHOD
  @document_ready: ->
    $('#new').on('click', 'a[data-clear-form]', Welcome.clear_form)

  @clear_form: (e) ->
    e.preventDefault()
    $('#new').empty()

resize_window = ->
  window_height = $(window).height()
  window_height = window_height - 45
  $('.galaxy').height( window_height )

$(document).ready(
  Welcome.document_ready
  resize_window()
  )