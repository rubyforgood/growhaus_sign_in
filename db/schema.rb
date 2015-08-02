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

ActiveRecord::Schema.define(version: 20150801220042) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities_roles", id: false, force: :cascade do |t|
    t.integer "activity_id"
    t.integer "role_id"
  end

  add_index "activities_roles", ["activity_id"], name: "index_activities_roles_on_activity_id"
  add_index "activities_roles", ["role_id"], name: "index_activities_roles_on_role_id"

  create_table "activity_sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.string   "waiver_signature"
    t.string   "photo_release"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "role_id"
    t.string   "volunteer_signature"
    t.datetime "volunteer_signed_at"
    t.datetime "waiver_signed_at"
    t.datetime "photo_release_signed_at"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image_url"
    t.string   "account_url"
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
