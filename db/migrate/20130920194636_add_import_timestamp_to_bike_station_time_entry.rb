class AddImportTimestampToBikeStationTimeEntry < ActiveRecord::Migration
  def change
    add_column :bike_station_time_entries, :import_timestamp, :integer
  end
end
