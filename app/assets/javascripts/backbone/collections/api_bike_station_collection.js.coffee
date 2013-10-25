# Bike Stations from the Bike Share API collections

exports = this
jQuery ->
	class ApiBikeStationCollection extends Backbone.Collection
		url:  ->
			return 'http://bayareabikeshare.com/stations/json/'

	exports.ApiBikeStationCollection = ApiBikeStationCollection