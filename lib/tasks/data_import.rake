desc "Imports data from the bayareabikeshare.com site"
task :import_data_from_bayarea_bike_share => :environment do
    puts "Starting API import\n".green

    response = HTTParty.get('http://bayareabikeshare.com/stations/json/')

    json_response = JSON.parse(response.body)

    stations_array = json_response["stationBeanList"]

    import_timestamp = DateTime.now.to_i

    stations_array.each do |station_json|
      puts "Parsing station: #{station_json['stationName']} - #{station_json['id']}".yellow
      station = find_or_create_bike_station(station_json)

      create_bike_station_time_entry(station, station_json, import_timestamp)
    end

    puts "\nDone importing data".green

end

# Helper method to create a bike station if needed and return a bike station
# Params:
# +station_json_hash+:: A hash containing the json representation of a bike station 
def find_or_create_bike_station station_json_hash
  # Slice only the neccessary attributes from the json that was received
  station_obj_hash = station_json_hash.slice(*BikeStation.attribute_names)

  # Remove the ID so it doesnt interfere with our DB ID
  station_obj_hash.delete("id")

  station = BikeStation.where(:original_id => station_json_hash["id"]).first_or_initialize(station_obj_hash)

  # If this is a new record then add the lat long and original_id
  if !station.persisted?
    station.latitude = station_json_hash['latitude'].to_d
    station.longitude = station_json_hash['longitude'].to_d
    station.original_id = station_json_hash["id"]
  end

  station.save! if station.changed?

  return station
end

# Helper method
# Params:
# +station+:: A BikeStation object
# +station_json_hash+:: A hash witht he json representation of an API call
# +import_time_stamp+:: A timestamp of the current so we can get all bike station data at once for a specific import
def create_bike_station_time_entry station, station_json_hash, import_timestamp
  status = find_or_create_bike_status(station_json_hash)

  entry = BikeStationTimeEntry.new
  entry.status_id = status.id
  entry.availableDocks = station_json_hash["availableDocks"]
  entry.availableBikes = station_json_hash["availableBikes"]
  entry.import_timestamp = import_timestamp
  entry.bike_station_id = station.id

  entry.save!
end

def find_or_create_bike_status status_json_hash
  status = BikeStationStatus.where(:original_key => status_json_hash["statusKey"]).first_or_initialize(
    :statusValue => status_json_hash["statusValue"],
    :original_key => status_json_hash["statusKey"],
  )

  status.save! if status.changed?

  return status
end