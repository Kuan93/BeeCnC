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

ActiveRecord::Schema.define(version: 20160921083636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "amenities", ["user_id"], name: "index_amenities_on_user_id", using: :btree

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_amenities", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "listing_amenities", ["amenity_id"], name: "index_listing_amenities_on_amenity_id", using: :btree
  add_index "listing_amenities", ["listing_id"], name: "index_listing_amenities_on_listing_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "room_type"
    t.integer  "room_number"
    t.integer  "price"
    t.time     "check_in"
    t.time     "check_out"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name",                           null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "amenities", "users"
  add_foreign_key "listing_amenities", "amenities"
  add_foreign_key "listing_amenities", "listings"
  add_foreign_key "listings", "users"
end
