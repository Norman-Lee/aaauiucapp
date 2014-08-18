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

ActiveRecord::Schema.define(version: 20140807235636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chairs", force: true do |t|
    t.string   "chair_type"
    t.integer  "officer_1_id"
    t.integer  "officer_2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chairs_events", id: false, force: true do |t|
    t.integer "event_id", null: false
    t.integer "chair_id", null: false
  end

  add_index "chairs_events", ["chair_id"], name: "index_chairs_events_on_chair_id", using: :btree
  add_index "chairs_events", ["event_id"], name: "index_chairs_events_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "event_time"
    t.text     "desc"
    t.datetime "deploy_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.string   "event_photo_file_name"
    t.string   "event_photo_content_type"
    t.integer  "event_photo_file_size"
    t.datetime "event_photo_updated_at"
  end

  create_table "events_members", id: false, force: true do |t|
    t.integer "member_id", null: false
    t.integer "event_id",  null: false
  end

  add_index "events_members", ["event_id"], name: "index_events_members_on_event_id", using: :btree
  add_index "events_members", ["member_id"], name: "index_events_members_on_member_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "class_standing"
    t.string   "sex"
    t.string   "e_mail"
    t.float    "attendance_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "officers", force: true do |t|
    t.string   "username"
    t.string   "salted_password"
    t.integer  "chair_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
