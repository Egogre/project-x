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

ActiveRecord::Schema.define(version: 20140206232025) do

  create_table "foods", force: true do |t|
    t.integer  "user_id"
    t.date     "consumed_on"
    t.string   "name"
    t.integer  "quantity"
    t.string   "serving_description"
    t.string   "serving_id"
    t.integer  "calories"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "food_id"
    t.float    "protein"
    t.float    "fat"
    t.float    "carbs"
    t.float    "fiber"
  end

  add_index "foods", ["user_id"], name: "index_foods_on_user_id"

  create_table "goals", force: true do |t|
    t.integer "steps"
    t.integer "calories"
    t.float   "fat"
    t.float   "protein"
    t.float   "carbohydrates"
    t.integer "user_id"
    t.float   "fiber"
    t.float   "sleep"
  end

  create_table "stats", force: true do |t|
    t.integer  "steps"
    t.float    "sleep"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["user_id"], name: "index_stats_on_user_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "secret"
  end

end
