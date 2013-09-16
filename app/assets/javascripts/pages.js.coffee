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
	
	map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

	return

google.maps.event.addDomListener(window, 'load', initialize)