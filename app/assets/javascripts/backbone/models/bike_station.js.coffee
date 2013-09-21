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
			alert "Im being initialized!"
			
	exports.BikeStation = BikeStation