class AddBikeStationIdToBikeStationTimeEntry < ActiveRecord::Migration
  def change
    add_column :bike_station_time_entries, :bike_station_id, :integer, :inverse_of => :bike_station
  end
end
