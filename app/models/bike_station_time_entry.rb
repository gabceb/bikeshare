class BikeStationTimeEntry < ActiveRecord::Base

  belongs_to :bike_station, :inverse_of => :bike_station_time_entries
  belongs_to :bike_station_status, :inverse_of => :bike_station_time_entries

end
