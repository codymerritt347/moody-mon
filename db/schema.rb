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

ActiveRecord::Schema.define(version: 2021_02_23_183025) do

  create_table "entries", force: :cascade do |t|
    t.string "time_of_day"
    t.string "feeling"
    t.string "situation"
    t.integer "intensity"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "favorite_food"
    t.integer "level"
    t.integer "exp_points"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_monsters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "favorite_color"
    t.string "favorite_food"
    t.integer "streak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coins"
  end

end
