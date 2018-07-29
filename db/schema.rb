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

ActiveRecord::Schema.define(version: 2018_07_29_210610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encounters", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "visit_number", null: false
    t.datetime "admitted_at", null: false
    t.datetime "discharged_at"
    t.text "location"
    t.string "room"
    t.string "bed"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first", null: false
    t.string "middle", null: false
    t.string "last", null: false
    t.integer "weight"
    t.integer "height"
    t.string "MRN", null: false
  end

  add_foreign_key "encounters", "patients"
end
