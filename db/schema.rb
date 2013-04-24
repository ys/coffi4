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

ActiveRecord::Schema.define(version: 20130423190250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: true do |t|
    t.integer  "value"
    t.integer  "place_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["place_id"], name: "index_notes_on_place_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "passwords", force: true do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passwords", ["place_id"], name: "index_passwords_on_place_id", using: :btree
  add_index "passwords", ["user_id"], name: "index_passwords_on_user_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "fsq_id"
    t.boolean  "wifi",       default: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "encrypted_password"
    t.string   "email"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "notes", "places", :name => "notes_place_id_fk"
  add_foreign_key "notes", "users", :name => "notes_user_id_fk"

  add_foreign_key "passwords", "places", :name => "passwords_place_id_fk"
  add_foreign_key "passwords", "users", :name => "passwords_user_id_fk"

  add_foreign_key "places", "users", :name => "places_creator_id_fk", :column => "creator_id"

end
