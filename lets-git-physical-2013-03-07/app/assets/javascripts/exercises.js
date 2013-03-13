$(function() {
  $('#show_chart').click(chart_data);
});

function chart_data() {
  var id = $('#activities').val();
  $.ajax({
    method: 'GET',
    url: "/exercises/" + id + "/chart"
  }).done(samp);

  return false;
}

function samp(chart) {
  console.log(chart);
  new Morris.Line({
    // ID of the element in which to draw the chart.
  element: 'myChart',

  data: chart,
  // The name of the data record attribute that contains x-values.
  xkey: 'activity',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['value'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['Value']
  });
}
