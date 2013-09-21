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
      t.decimal :latitude, :precision => 10, :scale => 6
      t.decimal :longitude, :precision => 10, :scale => 6

      t.timestamps
    end
  end
end
