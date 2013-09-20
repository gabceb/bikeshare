class CreateBikeStationStatuses < ActiveRecord::Migration
  def change
    create_table :bike_station_statuses do |t|
      t.integer :original_key
      t.string :statusValue

      t.timestamps
    end
  end
end
