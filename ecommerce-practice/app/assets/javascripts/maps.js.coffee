window.display_map = (lat, lon, zoom) ->
  mapOptions =
    center: new google.maps.LatLng(lat, lon)
    zoom: zoom
    mapTypeId: google.maps.MapTypeId.ROADMAP

  canvas = $('#map_canvas')[0]
  window.map = new google.maps.Map(canvas, mapOptions)

window.add_marker = (lat, lon, title) ->
  latlng = new google.maps.LatLng(lat, lon)
  marker = new google.maps.Marker({position: latlng, map: window.map, title: title})
  markers.push(marker)

window.filter_products = ->
  search = $('#search').val()
  settings =
    dataType: 'script'
    method: 'GET'
    url: "/products/search?query=#{search}"
  $.ajax(settings)