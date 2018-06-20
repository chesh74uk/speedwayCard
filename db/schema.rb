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

ActiveRecord::Schema.define(version: 2018_06_20_135358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "away_gates", force: :cascade do |t|
    t.bigint "heat_id"
    t.integer "gate_number"
    t.string "helmet_colour"
    t.string "rider_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heat_id"], name: "index_away_gates_on_heat_id"
  end

  create_table "blues", force: :cascade do |t|
    t.bigint "heat_id"
    t.integer "gate_number"
    t.string "rider_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heat_id"], name: "index_blues_on_heat_id"
  end

  create_table "gates", force: :cascade do |t|
    t.bigint "heat_id"
    t.integer "gate_number"
    t.string "helmet_colour"
    t.string "rider_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heat_id"], name: "index_gates_on_heat_id"
  end

  create_table "heats", force: :cascade do |t|
    t.decimal "heat_time"
    t.integer "heat_number"
    t.bigint "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_heats_on_meeting_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.date "date"
    t.string "home_team"
    t.string "away_team"
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "home_rider_1"
    t.string "home_rider_2"
    t.string "home_rider_3"
    t.string "home_rider_4"
    t.string "home_rider_5"
    t.string "home_rider_6"
    t.string "home_rider_7"
    t.string "away_rider_1"
    t.string "away_rider_2"
    t.string "away_rider_3"
    t.string "away_rider_4"
    t.string "away_rider_5"
    t.string "away_rider_6"
    t.string "away_rider_7"
  end

  create_table "reds", force: :cascade do |t|
    t.bigint "heat_id"
    t.integer "gate_number"
    t.string "rider_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heat_id"], name: "index_reds_on_heat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "whites", force: :cascade do |t|
    t.bigint "heat_id"
    t.integer "gate_number"
    t.string "rider_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heat_id"], name: "index_whites_on_heat_id"
  end

  create_table "yellows", force: :cascade do |t|
    t.bigint "heat_id"
    t.integer "gate_number"
    t.string "rider_name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heat_id"], name: "index_yellows_on_heat_id"
  end

  add_foreign_key "away_gates", "heats"
  add_foreign_key "blues", "heats"
  add_foreign_key "gates", "heats"
  add_foreign_key "heats", "meetings"
  add_foreign_key "reds", "heats"
  add_foreign_key "whites", "heats"
  add_foreign_key "yellows", "heats"
end
