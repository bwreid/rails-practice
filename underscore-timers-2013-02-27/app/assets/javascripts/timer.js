$(function(){
  $('#submit').click(add_number);
  $('#square').click(square_numbers);
  $('#fn').click(generic_function);
  $('#start').click(start_timer);
  $('#stop').click(stop_timer);
  $('#clear').click(empty_numbers);
  $('#numbers').on('click', '.num-box', select);
});

var numbers_array = [];

var timer = null;

function start_timer(){
  timer = setInterval(generate_random_number, 500); // 2000 milliseconds
}

function stop_timer(){
  clearInterval(timer);
}

function generate_random_number(){
  var num = _.random(1,99);
  numbers_array.push(num);
  var box = $('<div>').addClass('num-box');
  $('#numbers').append( box.text(num) );
}

function add_number(){
  var box = $('<div>').addClass('num-box');
  var num = parseInt($('#enter').val());
  $('#numbers').append( box.text(num) );
  numbers_array.push(num);
  $('#enter').val('').focus();
}

function generic_function(){
  empty_numbers();
  numbers_array = _.map(numbers_array, funky_calc);
  show_numbers();
}

function funky_calc(x){
  var equation = $('#enter').val();
  return eval(equation);
}

function select() {
  $('.calculation p').text($(this).text());
}

function square_numbers(){
  empty_numbers();
  numbers_array = _.map(numbers_array, square_value);
  show_numbers();
}

function square_value(num){
  return num * num;
}

function empty_numbers(){
  $('#numbers').empty();
}

function show_numbers(){
  _.each(numbers_array, create_number_box);
}

function create_number_box(num) {
  var box = $('<div>').addClass('num-box');
  $('#numbers').append( box.text(num) )
}