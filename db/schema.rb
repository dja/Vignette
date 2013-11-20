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

ActiveRecord::Schema.define(version: 20131120050243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "photographer_id"
    t.integer  "customer_id"
    t.string   "camera"
    t.string   "lat"
    t.string   "long"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["customer_id"], name: "index_albums_on_customer_id", using: :btree
  add_index "albums", ["photographer_id"], name: "index_albums_on_photographer_id", using: :btree

  create_table "invitations", force: true do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_birthday"
    t.string   "username"
    t.string   "link"
    t.string   "image"
    t.string   "user_location"
    t.string   "meetup_location"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "photographer_location"
    t.integer  "rating"
    t.integer  "radius"
    t.string   "camera"
    t.string   "bio"
    t.string   "fact"
    t.boolean  "available"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
  end

end
