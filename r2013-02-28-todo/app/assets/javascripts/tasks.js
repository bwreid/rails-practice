$(function() {
  $('#task_form_button').click(toggle_form);
  $('#add_task_from_form').click(add_new_task);
  $('#edit_task_from_form').click(update_task);
  $('#task_form_cancel').click(cancel_button_on_form);
  $('.task_list').on('click', '#task_delete', delete_task);
  $('.task_list').on('click', '.one_task', add_existing_task_to_form);
  $('.task_list').on('dblclick', '.one_task', strike);
});

var map;

function strike() {
  $(this).toggleClass('completed');
  var token = $('input[name=authenticity_token]').val();
  var task_id = $('.task_form').find('#task_id').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/tasks/" + task_id + '/complete',
      data: { authenticity_token:token },
      success: process_tasks,
      error: console.log('!')
    });
}

function delete_task() {
  var token = $('input[name=authenticity_token]').val();
  var task_id = $(this).prev().text();
  $(this).parent().remove();
  tasks = _.reject(tasks, function(t){ return t.id == task_id; });

  $.ajax({
    dataType: 'json',
    type: 'delete',
    url: '/tasks/' + task_id,
    data: {authenticity_token:token},
    error: console.log('!')
  });

  return false;
}

function add_existing_task_to_form () {
  $('.task_form').removeClass('hide');
  $('#add_task_from_form').hide();
  $('#edit_task_from_form').show();
  $('.task_form').find('#title').val( $(this).children().first().text() );
  $('.task_form').find('#address').val( $(this).children().first().next().text() );
  $('.task_form').find('#description').val( $(this).children().first().next().next().text() );
  $('.task_form').find('#priority').val( $(this).children().first().next().next().next().next().text() );
  $('.task_form').find('#duedate').val( $(this).children().first().next().next().next().next().next().text() );
  $('.task_form').find('#task_id').val( $(this).children().first().next().next().next().next().next().next().text() );
}

function update_task() {
  var token = $('input[name=authenticity_token]').val();
  var title = $('.task_form').find('#title').val();
  var address = $('.task_form').find('#address').val();
  var description = $('.task_form').find('#description').val();
  var priority_id = $('.task_form').find('#priority').val();
  var duedate = $('.task_form').find('#duedate').val();
  var task_id = $('.task_form').find('#task_id').val();

  $.ajax({
      dataType: 'json',
      type: "post",
      url: "/tasks/" + task_id,
      data: {_method:'put', authenticity_token:token, 'task[title]':title, 'task[address]':address, 'task[description]':description, 'task[duedate]':duedate, 'task[priority_id]':priority_id},
      success: process_tasks,
      error: console.log('!')
    });

  return false;
}

function add_new_task() {
  var token = $('input[name=authenticity_token]').val();
  var title = $('.task_form').find('#title').val();
  var address = $('.task_form').find('#address').val();
  var description = $('.task_form').find('#description').val();
  var priority_id = $('.task_form').find('#priority').val();
  var duedate = $('.task_form').find('#duedate').val();

  $.ajax({
    dataType: 'json',
    type: 'post',
    url: '/tasks',
    data: {authenticity_token:token, 'task[title]':title, 'task[address]':address, 'task[description]':description, 'task[duedate]':duedate, 'task[priority_id]':priority_id},
    success: process_tasks,
    error: console.log('!')
  });

  return false;
}

function process_tasks(task_list) {
  _.each(task_list, shift_task_order);
  $('.one_task').remove();
  _.each(tasks, display_task);
}

function shift_task_order(task) {
  tasks = _.reject(tasks, function(t){return t.id == task.id;});
  tasks.push(task);
  tasks = _.sortBy(tasks, function(t){ return t.name; }).reverse();
  tasks = _.sortBy(tasks, function(t){
    if(t.priority_value){
      return parseInt(t.priority_value);
    } else{
      return t.priority.value;
    }

  });
  console.log(tasks);
}

function display_task(msg) {
  if(msg.priority_color) {
    var ul = $('<ul>').addClass('one_task').css('background-color', msg.priority_color);
    var priority = $('<li>').text(msg.priority);
    var priority_hide = $('<div>').addClass('hide').text(msg.priority_id);
  } else {
    var ul = $('<ul>').addClass('one_task').css('background-color', msg.priority.color);
    var priority = $('<li>').text(msg.priority.name);
    var priority_hide = $('<div>').addClass('hide').text(msg.priority.id);
  }

  var title = $('<li>').text(msg.title);
  var address = $('<li>').text(msg.address);
  var description = $('<li>').text(msg.description);
  var duedate = $('<li>').text(msg.duedate);
  var task_hide = $('<div>').addClass('hide').text(msg.id);
  var delete_link = $('<a>').attr('href', '#').attr('id', 'task_delete').text('Delete');

  if(msg.priority_value == 0 || msg.priority.value == 0)
    ul.addClass('completed');

  ul.append([title, address, priority, priority_hide, description, duedate, task_hide, delete_link]);
  add_marker(msg.latitude, msg.longitude, msg.title);
  $('.task_list').prepend(ul);
  clear_input_fields();
}

function clear_input_fields() {
  $('.task_form').find('#title').val('');
  $('.task_form').find('#address').val('');
  $('.task_form').find('#description').val('');
  $('.task_form').find('#priority').val('');
  $('.task_form').find('#duedate').val('');
  $('.task_form').find('#title').focus();
}

function cancel_button_on_form() {
  $('.task_form').addClass('hide');
  return false;
}

function toggle_form() {
  $('.task_form').toggleClass('hide');
  $('#add_task_from_form').show();
  $('#edit_task_from_form').hide();
}

function display_map(lat, long, zoom) {
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}

function add_marker(lat, long, title){
  var latlng = new google.maps.LatLng(lat, long);
  var marker = new google.maps.Marker({position: latlng, map: map, title: title});
}