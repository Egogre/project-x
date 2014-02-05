ActiveRecord::Schema.define(version: 20140204222047) do

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
    t.integer "sleep"
    t.integer "calories"
    t.float   "fat"
    t.float   "protein"
    t.float   "carbohydrates"
    t.integer "user_id"
    t.float   "fiber"
  end

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
