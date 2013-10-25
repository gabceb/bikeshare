# Bike Station Model

exports = this
jQuery ->
	class BikeStation extends Backbone.Model

		defaults:
			stationName : null
			id : null
			original_id : null
			totalDocks : null
			stAddress1 : null
			stAddress2 : null
			city : null
			postalCode : null
			location : null
			landmark : null
			latitude : null
			longitude : null

		url: () =>
			return null

		initialize: ()=>
			return @

		# Returns an object of lat/long as floats
		lat_long: () =>
			lat_i = parseFloat(@get('latitude'))
			long_i = parseFloat(@get('longitude'))

			return { latitude: lat_i, longitude: long_i }
			
	exports.BikeStation = BikeStation