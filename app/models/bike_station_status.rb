class BikeStationStatus < ActiveRecord::Base

  has_many :bike_station_time_entries, :foreign_key => :status_id, :inverse_of => :status
end
