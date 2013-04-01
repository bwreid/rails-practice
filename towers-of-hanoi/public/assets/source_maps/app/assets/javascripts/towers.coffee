class Tower
  @document_ready: ->
    $('.all-towers').on('click', '.block', Tower.select_block)
    $('.all-towers').on('click', '.columns', Tower.move_block)
    $('.all-towers').on('click', '.columns', Tower.check_for_win)
    $('#reset').on('click', Tower.reset_game)

  @select_block: ->
    if $(this).parent().children().first().data('block-level') == $(this).data('block-level')
      $('.all-towers').find('.picked').removeClass('picked')
      $(this).addClass('picked')

  @move_block: ->
    if $('.all-towers').find('.picked')
      if $(this).children().first().data('block-level') is undefined or $(this).children().first().data('block-level') < $('.all-towers').find('.picked').data('block-level')
        picked = $('.all-towers').find('.picked')
        $(this).prepend(picked)

  @check_for_win: ->
    if $('.second-tower').children().length == 0 and $('.first-tower').children().length == 0
      alert('You win!')

  @reset_game: (e) ->
    e.preventDefault()
    $('input.button').removeClass('disabled')
    $('.first-tower').empty()
    $('.second-tower').empty()
    $('.third-tower').empty()

@seconds = 0

window.tick = ->
  @seconds += 1
  $('h2').text("#{@seconds} seconds.")
  if $('.second-tower').children().length == 0 and $('.first-tower').children().length == 0
    $('h2').text("Finished at #{@seconds} seconds.")
    @seconds = 0
  else
    window.setTimeout(window.tick, 1000);

window.size_blocks = (num) ->
  change_size(width) for width in $('.first-tower').children()
  height = $('.first-tower').height()
  $('.second-tower').height(height)
  $('.third-tower').height(height)

window.change_size = (block) ->
  width = $('.first-tower').width()
  $(block).width(width / $(block).data('block-level'))

$(document).ready(Tower.document_ready)
