$(function(){
  create_canvas();
  $('#submit').click(add_bucket);
  $('#clear').click(clear_buckets);
  $('#submit_image').click(add_image);
  $('#clear_background').click(clear_backdrop);
  $('#colors').on('click', '.bucket', set_color);
  $('#canvas').on('mouseover', '.box', set_cell_color);
  $('#images').on('click', '.bucket', set_background);
});

// i = $('<img>').attr('src', '_____');

function create_canvas() {
  for(var i = 0; i < 9000; i++){
    var cell = $('<div>').addClass('box');
    $('#canvas').append(cell);
  }
}

function add_image() {
  var image = $('#image').val();
  var bucket = $('<div>').addClass('bucket').css('background', 'url(' + image + ')');
  if(bucket.css('background')) {
    $('#images').append(bucket);
    $('#image').val('').focus();
  }
}

function add_bucket() {
  var color = $('#color').val();
  var bucket = $('<div>').addClass('bucket').css('background-color', color);
  if(bucket.css('background-color')) {
    $('#colors').append(bucket);
    $('#color').val('').focus();
  }
}

function set_background() {
  var current = $(this).css('background');
  $('#canvas').css('background', current);
}

function set_cell_color() {
  var current = $('.header .bucket').css('background-color');
  $(this).css('background-color', current);
}

function set_color() {
  var current = $(this).css('background-color');
  $('.header .bucket').css('background-color', current);
}

function clear_buckets() {
  $('#colors').children().remove();
  $('.header .bucket').css('background-color', 'white');
}

function clear_backdrop() {
  $('#canvas').css('background', '');
}