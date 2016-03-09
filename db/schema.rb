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

ActiveRecord::Schema.define(version: 20160307172051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_performers", force: :cascade do |t|
    t.integer  "performer_id"
    t.integer  "band_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description",  null: false
    t.string   "location",     null: false
    t.float    "price"
    t.integer  "user_id",      null: false
    t.integer  "performer_id"
    t.integer  "band_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "performers", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "email",           null: false
    t.string   "full_name",       null: false
    t.string   "affiliates"
    t.string   "instruments"
    t.text     "bio"
    t.float    "ratings"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "performers", ["username"], name: "index_performers_on_username", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.float    "value",        null: false
    t.text     "comment"
    t.integer  "user_id",      null: false
    t.integer  "performer_id"
    t.integer  "band_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "email",           null: false
    t.string   "full_name",       null: false
    t.text     "bio"
    t.float    "ratings"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
