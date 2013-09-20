class BikeStation < ActiveRecord::Base
  set_rgeo_factory_for_column(:latlon, RGeo::Geographic.spherical_factory(:srid => 4326))
  
  has_many :bike_station_time_entries, :inverse_of => :bike_station

end
