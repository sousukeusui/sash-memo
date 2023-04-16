# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_04_16_070732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "one_time_authentications", force: :cascade do |t|
    t.integer "function_name", null: false
    t.string "user_key", null: false
    t.string "client_token"
    t.integer "password_length", null: false
    t.string "password_digest", null: false
    t.integer "expires_seconds", null: false
    t.integer "failed_count", default: 0, null: false
    t.integer "max_authenticate_password_count", default: 3, null: false
    t.datetime "authenticated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_key"], name: "index_one_time_authentications_on_user_key"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "address", limit: 50, null: false
    t.datetime "research_date"
    t.datetime "construction_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", limit: 15, null: false
    t.string "uid"
    t.string "provider"
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sites", "users"
end
