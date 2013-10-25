exports = this

jQuery ->
	class BikeShareMapRouter extends Backbone.Router
		routes:
			"" : "index"

		initialize: (options) ->
			Backbone.history.start({pushState:true});

			# Code to make sure we using the push state of html5 browsers to avoid refreshing all JS. Grabbed from https://github.com/backbone-boilerplate/backbone-boilerplate
			$(document).on('click', 'a:not([data-bypass]):not(.ui-widget)', (evt) ->
				href = $(this).attr 'href'
				protocol = "#{@protocol}/"

				if href.slice(protocol.length) != protocol
					evt.preventDefault()
					window.router.navigate( href, true )
			)

			return @

		index: ()=>

			api_bike_stations = new ApiBikeStationCollection(null , { model: BikeStation })
			
			view = new BikeShareMapIndexView(
				container : $("body"),
				collection : api_bike_stations
			)
			
			view.render()

			api_bike_stations.fetch()
			return

	exports.BikeShareMapRouter = BikeShareMapRouter