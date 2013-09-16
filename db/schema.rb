# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130916020924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "postgis"

  create_table "bike_stations", force: true do |t|
    t.integer  "original_id"
    t.string   "name",                                                                 null: false
    t.integer  "totalDocks"
    t.string   "stAddress1"
    t.string   "stAddress2"
    t.string   "city"
    t.string   "postalCode"
    t.string   "location"
    t.string   "landmark"
    t.spatial  "latLong",     limit: {:srid=>4326, :type=>"point", :geographic=>true}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
