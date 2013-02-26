$(function(){

  // $('#First').blur(blur_func);
  // $('#First').change(change_func);
  // $('#Age').change(change_func);
  // $('body').mousemove(colorize);
  $('body').keypress(show_key)
});

var notice = $('<p>');

function show_key(data) {
  var response = String.fromCharCode(data.which);
  $('#text').append(response);
  switch(response) {
    case 'b':
      $('#text').css('color', 'blue');
      break;
    case 'g':
      $('#text').colors('color', 'green');
      break;
    case 'y':
      $('#text').css('color', 'yellow');
      break;
    case 'r':
      $('#text').css('color', 'red');
      break;
    case 'p':
      $('#text').css('color', 'purple');
      break;
    default:
      $('#text').css('color', 'black');
  }
}

function blur_func() {
  // if($('#First').length < 10);
  //   $('#First').addClass('red');
}

function change_func() {
  notice.removeClass();
  var age_input = $('#Age').val()
  if(age_input >= 18) {
    $('#Age').after(notice.text('You are ' + parseInt(age_input) + ' years old.').addClass('blue'));
  } else {
    $('#Age').after(notice.text('You are ' + parseInt(age_input) + ' years old.').addClass('red'));
  }
}

function focus_func() {
  alert('focus');
}

function colorize(eventdata) {
  var x_val = eventdata.clientX;
  var y_val = eventdata.clientY;
  $('#x').text(x_val);
  if( (eventdata.clientX % 2) == 0 ) {
    $('#x').css('color', '#FFF');
  } else {
    $('#x').css('color', '#aaa');
  }

  $('#y').text(y_val);
  if( (eventdata.clientY % 2) == 0 ) {
    $('#y').css('color', '#fff');
  } else {
    $('#y').css('color', '#aaa');
  }

  $('body').css('background', 'rgb(' + ((x_val/4)%255) + ',' + ((y_val/2)%255) + ',0)')
}