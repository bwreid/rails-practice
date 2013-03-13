$(function() {

  $('#search').click(search_flickr);
  $('#clear').click(clear_photos);
  $('#start').click(start);
  $('#stop').click(stop);
  $('#images').on('click', '.box', show_large);

});

var timer = null;
var count = 0;
var array = null;
var perpage = 500;
var flickr_page = 1;
var current_picture = null;


function start() {
  timer = setInterval(rotate_image, (parseInt($('#length').val()) * 1000) );
}

function stop() {
  clearInterval(timer);
}

function rotate_image() {
  var image = current_picture.css('background-image');
  $('#large-image').css('background-image', image);
  current_picture = current_picture.next();
}

function search_flickr() {
  var search = $('#input').val();
  var page = flickr_page;
  $.getJSON('http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=29e7b3e5759bcdaf81857e3d0fc94359&text=' + search + '&per_page=' + perpage + '&page=' + flickr_page + '&format=json&jsoncallback=?', results);
}

function results(data) {
  // _.each(array, compile_photo);
  array = data.photos.photo;
  timer = setInterval( progressive_add, (parseInt($('#length').val()) * 1000) );
}

function progressive_add(){
  if(count == (perpage - 1)) {
    clearInterval(timer);
    count = 0;
    flickr_page++;
    console.log('new page!');
    search_flickr();
  } else {
    compile_photo(array[count]);
    count++;
  }
}

function compile_photo(item) {
  var box = $('<div>').addClass('box');
  var image = "http://farm"+ item.farm +".static.flickr.com/"+ item.server +"/"+ item.id +"_"+ item.secret +"_m.jpg";
  box = box.css({'width' : $('#width').val(), 'height' : $('#height').val(), 'background-image' : 'url(' + image + ')'});
  $('#images').prepend(box);
}

function clear_photos() {
  $('#images').empty();
}

function show_large() {
  var image = $(this).css('background-image');
  current_picture = $(this);
  $('#large-image').css('background-image', image);
}