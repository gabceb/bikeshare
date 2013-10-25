exports = this

jQuery ->
	class BikeShareMapIndexView extends Backbone.View
		template: JST['backbone/templates/index']()
		className: "bike-share-index"
		tagName: "div"

		initialize: () ->
			# Append el to container:
			$(@options.container).append( @el )

			@collection.on("add", @addBikeStation)
			@collection.on("add", @removeBikeStation)

			return @

		render: () =>
			template = _.template( @template )
			$(@el).html(template())

			@initialize_map()

			return @

		unrender: () =>
			@$el.remove()
			return

		addBikeStation: (bike_station) =>

			lat_long = bike_station.lat_long
			
			station_position = new google.maps.LatLng(lat_long['latitude'], lat_long['longitude'])

			@addMarker(station_position)
			
			return

		addMarker: (position, options) =>
			marker = new google.maps.Marker({
				map: @map,
				animation: google.maps.Animation.DROP,
				position: position
			})

		removeBikeStation: (bike_station) =>
			return

		initialize_map: ()=>
			@mapOptions = {
			  center: new google.maps.LatLng(37.33067, -121.901593),
			  zoom: 10,
			  mapTypeId: google.maps.MapTypeId.ROADMAP
			  mapTypeControl: false
			}
			
			@map = new google.maps.Map($(".canvas-map", @$el)[0], @mapOptions)

			@requestUserLocation()

			return

		onUserLocationSuccess : (location)=>
			window.log "User location Latitude: #{location.coords.latitude} - Longitude: #{location.coords.longitude}"
			@map.setCenter(new google.maps.LatLng(location.coords.latitude, location.coords.longitude))
			@map.setZoom(14)

			return

		onUserLocationError: ()=>
			alert "An error happened while getting your location"

		requestUserLocation: ()=>
			if Modernizr.geolocation
				navigator.geolocation.getCurrentPosition(@onUserLocationSuccess, @onUserLocationError);

	exports.BikeShareMapIndexView = BikeShareMapIndexView