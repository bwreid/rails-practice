$(function() {

  _.each($('.priority .hide'), colorize_priorities);
  $('#toggleButton').click(switch_boxes);
  $('#new_priority').on('click', '#cancel_priority', switch_boxes);
  $('#create_p').click(create_priority);
  $('#update_p').click(update_priority);
  $('#priority_list').on('click', '.priority', go_to_edit);
  $('#priority_list').on('click', '.up', go_up);
  $('#priority_list').on('click', '.down', go_down);

  init_minicolors();
  $('#update_p').hide();

});

function go_up() {
  var id = $(this).parent().prev().find('div').last().text();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
    dataType: 'json',
    type: "POST",
    url: "/priorities/" + id + "/up",
    data: {authenticity_token:token}
  }).done(edit_show_priority);

}

function go_down() {
  var id = $(this).parent().prev().find('div').last().text();
  var token = $('input[name=authenticity_token]').val();

  $.ajax({
    dataType: 'json',
    type: "POST",
    url: "/priorities/" + id + "/down",
    data: {authenticity_token:token}
  }).done(edit_show_priority);

}

function go_to_edit() {
  if($('#new_priority fieldset').hasClass('hide'))
    switch_boxes();

  show_edit();

  var title = $(this).find('h6').first().text();
  var color = $(this).find('.hide').first().text();
  var value = $(this).find('h6').last().text();
  var priority_id = $(this).find('.hide').last().text();

  $('#name').val(title);
  $('#color').val(color);
  $('input.minicolors').minicolors('value', color);
  $('#value').val(value);
  $('#priority_id').val(priority_id);
}

function create_priority() {
  var token = $('input[name=authenticity_token]').val();
  var color = $('INPUT.minicolors').minicolors('value');
  var name = $('#name').val();
  var value = +$('#value').val();
  priority_array.push({title:name, level:value, color:color});

  $.ajax({
    dataType: 'json',
    type: "POST",
    url: "/priorities",
    data: {authenticity_token:token, 'priority[color]':color, 'priority[title]':name, 'priority[level]':value}
  }).done(sort_priorities);

  return false;
}

function update_priority() {
  var token = $('input[name=authenticity_token]').val();
  var color = $('INPUT.minicolors').minicolors('value');
  var name = $('#name').val();
  var value = +$('#value').val();
  var priority_id = $('#priority_id').val();

  $.ajax({
    dataType: 'json',
    type: "POST",
    url: "/priorities/" + priority_id,
    data: {_method:'PUT', authenticity_token:token, 'priority[color]':color, 'priority[title]':name, 'priority[level]':value}
  }).done(edit_show_priority);

  return false;
}

function display_priority(message) {
  var priority = $('<div>').addClass('priority').css('background-color', message.color);
  var title_heading = $('<h6>').text(message.title);
  var level_heading = $('<h6>').text(message.level);
  var hidden_field = $('<div>').addClass('hide').text(message.color);
  var hidden_id = $('<div>').addClass('hide').text(message.id);

  var div = $('<div>').addClass('arrows');
  var up_arrow = $('<img>').attr('src', '/assets/arrow_up.png').addClass('up');
  var down_arrow = $('<img>').attr('src', '/assets/arrow_down.png').addClass('down');
  div.append([up_arrow, down_arrow]);

  $('#priority_list').prepend(priority);
  $('.priority').first().append([title_heading, level_heading, hidden_field, hidden_id]).after(div);

  switch_boxes();
  clear_fields();
}

function edit_show_priority(message) {

  priority_array = _.reject(priority_array, function(y){ return y.id == message.id; });
  priority_array.push(message);
  sort_priorities();

  clear_fields();
}

function clear_fields() {
  $('#name, #color, #value').val('');
  $('input.minicolors').minicolors('value', '');
}

function show_edit() {
  $('#update_p').show();
  $('#create_p').hide();
  $('#name').focus();
}

function show_new() {
  $('#update_p').hide();
  $('#create_p').show();
  $('#name').focus();
  clear_fields();
}

function switch_boxes() {
  $('#new_priority .new_button').toggleClass('hide');
  $('#new_priority fieldset').toggleClass('hide');

  show_new();
}

function colorize_priorities(hidden) {
  var color = $(hidden).first().text();
  $(hidden).parent().css('background-color', color);
}

function sort_priorities() {
  var sorted_list = _.sortBy(priority_array, function(x){ return x.level; });
  $('.priority').remove();
  $('.arrows').remove();
  _.each(sorted_list, display_priority);
}

function init_minicolors() {
  var settings = {
    animationSpeed: 100,
    animationEasing: 'swing',
    change: null,
    changeDelay: 0,
    control: 'hue',
    defaultValue: '#FFCC00',
    hide: null,
    hideSpeed: 100,
    inline: false,
    letterCase: 'lowercase',
    opacity: false,
    position: 'default',
    show: null,
    showSpeed: 100,
    swatchPosition: 'left',
    textfield: true,
    theme: 'default'
  };
  $('INPUT.minicolors').minicolors(settings);
}