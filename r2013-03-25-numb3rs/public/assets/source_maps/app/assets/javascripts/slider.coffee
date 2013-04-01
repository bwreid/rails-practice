class Slider

  @document_ready: ->
    $('#slider').slider({ min: 1, max: $('#slider').data('total'), step: 1, slide: Slider.sliding })
    # $('#slider').slider('option', 'value', $('li img').length)

  @sliding: (e, ui) ->
    console.log('ui: ' + ui.value )
    count = ui.value
    settings =
      dataType: 'json' # THIS MEANS JS IS EXPECTING EXECUTABLE JS BACK
      type: 'get'
      url: "/find?count=#{count}" # THIS SENDS BACK SOMETHING LIKE /albums/3/filter?count=4
    $.ajax(settings).done(Slider.display) # THAT'S OUR AJAX CALL

  @display: (msg) ->
    $('#word').text(msg.word)
    $('#hex').text(msg.hex)
    $('#dec').text(msg.dec)
    $('#bin').text(msg.bin)
    $('body').css('background-color', msg.color)

$(document).ready(Slider.document_ready)
