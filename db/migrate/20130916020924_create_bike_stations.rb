class CreateBikeStations < ActiveRecord::Migration
  def change
    create_table :bike_stations do |t|
      t.integer :original_id
      t.string :stationName, :null => false
      t.integer :totalDocks
      t.string :stAddress1
      t.string :stAddress2
      t.string :city
      t.string :postalCode
      t.string :location
      t.string :landmark
      t.point :latLong, :srid => 4326, :null => false, :geographic => true

      t.timestamps
    end
  end
end
