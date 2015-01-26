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

ActiveRecord::Schema.define(version: 20150125152311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balls", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "balls_games", id: false, force: :cascade do |t|
    t.integer "ball_id", null: false
    t.integer "game_id", null: false
  end

  add_index "balls_games", ["ball_id", "game_id"], name: "index_balls_games_on_ball_id_and_game_id", unique: true, using: :btree
  add_index "balls_games", ["game_id", "ball_id"], name: "index_balls_games_on_game_id_and_ball_id", unique: true, using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "lottery_contest_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "games", ["lottery_contest_id"], name: "index_games_on_lottery_contest_id", using: :btree

  create_table "lottery_contests", force: :cascade do |t|
    t.integer  "number",          null: false
    t.integer  "lottery_type_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lottery_types", force: :cascade do |t|
    t.string   "game"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "balls_games", "balls"
  add_foreign_key "balls_games", "games"
  add_foreign_key "games", "lottery_contests"
  add_foreign_key "lottery_contests", "lottery_types"
end
