class BikeStation < ActiveRecord::Base
  
  has_many :bike_station_time_entries, :inverse_of => :bike_station

end
