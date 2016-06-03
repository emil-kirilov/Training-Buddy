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

ActiveRecord::Schema.define(version: 20160424100428) do

  create_table "days", force: :cascade do |t|
    t.integer  "protein",    default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.date     "day",                    null: false
    t.integer  "user_id"
  end

  add_index "days", ["user_id"], name: "index_days_on_user_id"

  create_table "foods", force: :cascade do |t|
    t.integer "user_id",                                                          null: false
    t.string  "name",         limit: 30,                                          null: false
    t.string  "description",  limit: 200
    t.integer "energy",                                           default: 0,     null: false
    t.decimal "fat",                      precision: 4, scale: 1, default: "0.0", null: false
    t.decimal "protein",                  precision: 4, scale: 1, default: "0.0", null: false
    t.decimal "carbohydrate",             precision: 4, scale: 1, default: "0.0", null: false
    t.decimal "fibre",                    precision: 4, scale: 1, default: "0.0", null: false
  end

  add_index "foods", ["user_id"], name: "index_foods_on_user_id"

  create_table "meals", force: :cascade do |t|
    t.integer "day_id",                            null: false
    t.integer "grams",       limit: 5, default: 0, null: false
    t.string  "description"
    t.integer "food_id"
  end

  add_index "meals", ["day_id"], name: "index_meals_on_day_id"
  add_index "meals", ["food_id"], name: "index_meals_on_food_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
