# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initialize = ()=>
	mapOptions = {
	  center: new google.maps.LatLng(37.33067, -121.901593),
	  zoom: 10,
	  mapTypeId: google.maps.MapTypeId.ROADMAP
	  mapTypeControl: false
	}
	
	window.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

	requestUserLocation()

	return

onUserLocationSuccess = (location)=>
	console.log "User location Latitude: #{location.coords.latitude} - Longitude: #{location.coords.longitude}"
	window.map.setCenter(new google.maps.LatLng(location.coords.latitude, location.coords.longitude))
	window.map.setZoom(14)

	return

onUserLocationError = ()=>
	alert "An error happened while getting your location"

requestUserLocation = ()=>
	if navigator.geolocation
		navigator.geolocation.getCurrentPosition(onUserLocationSuccess, onUserLocationError);

google.maps.event.addDomListener(window, 'load', initialize)