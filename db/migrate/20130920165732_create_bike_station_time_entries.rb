class CreateBikeStationTimeEntries < ActiveRecord::Migration
  def change
    create_table :bike_station_time_entries do |t|
      t.integer :availableDocks
      t.integer :status_id
      t.integer :availableBikes

      t.timestamps
    end
  end
end
