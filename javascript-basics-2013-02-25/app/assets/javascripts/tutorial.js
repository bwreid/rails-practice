// alert('hi')
// Comments work the same as in CSS
/*
Mult-line
*/

// var first = prompt( 'enter your name' );
// alert( 'You just entered in ' + first );
// console.log('Hi, ' + first);

// var age = prompt('How old are you?');
// age = parseInt(age);

// if(age < 18) {
//   console.log('Alright, well have fun at home.')
// } else {
//   console.log('Hooray! Let\'s go out!')
// }

// switch(age) {
//   case 10:
//     console.log('you are 10');
//     break;
//   case 20:
//     console.log('you are 20');
//     break;
//   case 30:
//     console.log('you are 30');
//     break;
//   default:
//     console.log('Well that\'s nice')
// }
// var x = 0
// while( x < 7 ){
//   console.log(x)
//   x += 1
// }

// var colors = [];
// var color = prompt('enter a color');

// while( color != 'q' ) {
//   colors.push(color)
//   color = prompt('enter a color')
// }

// for( var i = 0; i < colors.length; i++ ) {
//   console.log(colors[i]);
// }

// function square(x) {
//   return (x * x);
// }

// function cubed(x) {
//   return (square(x) * x)
// }

// function area(x,y) {
//   return (x * y);
// }

// var response = prompt('(s)quare, (c)ubed, (a)rea or (q)uit');

// while( response != 'q' ) {
//   switch(response) {
//     case 's':
//       num = prompt('What number do you want to square?');
//       num = parseInt(num);
//       console.log('Your number is: ' + square(num));
//       break;
//     case 'c':
//       num = prompt('What number do you want to cube?');
//       num = parseInt(num);
//       console.log('Your number is: ' + cubed(num) );
//       break;
//     case 'a':
//       l = prompt('What is the length?');
//       l = parseInt(l);
//       w = prompt('What is the width?');
//       w = parseInt(w);
//       console.log( 'The area is: ' + area(l,w) );
//       break;
//     default:
//       console.log( 'Er, try again.' );
//   }
//   var response = prompt('(s)quare, (c)ubed, (a)rea or (q)uit');
// }

$(function(){  // This code will only run after the last element is run in the browser.

  $('.field #btn').click(color_change);
  $('.field #color').click(body_color_change);
  $('button.hide').click(hide);
  $('button.show').click(show);
  $('#calculate').click(calculate);

});

function color_change() {
  var name = $('.field #first').val();
  $('h1').css('color', '#FF0000').text(name);
}

function body_color_change() {
  var colors = $('.field #color').val();
  $('body').css('background-color', colors);
}

function hide() {
  $('.box').hide();
}

function show() {
  $('.box').show();
}

function area(x,y) {
  return (x * y);
}

function calculate() {
  var x = $('.calculator #first').val();
  var y = $('.calculator #second').val();
  x = parseInt(x);
  y = parseInt(y);

  $('.response p').text(area(x,y));
  var value = area(x,y)

  if( value > 100 ){
    $('.calculator').addClass('success');
    $('.calculator').removeClass('alert');
  } else {
    $('.calculator').addClass('alert');
    $('.calculator').removeClass('success');
  }

}
