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

ActiveRecord::Schema[7.0].define(version: 2023_05_07_140714) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "construction_kinds", force: :cascade do |t|
    t.integer "kind_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contractors_on_user_id"
  end

  create_table "inner_sashes", force: :cascade do |t|
    t.integer "color", null: false
    t.integer "number_of_shoji", null: false
    t.integer "width_up_size", null: false
    t.integer "width_down_size", null: false
    t.integer "width_middle_size", null: false
    t.integer "height_left_size", null: false
    t.integer "height_right_size", null: false
    t.integer "height_middle_size", null: false
    t.integer "width_frame_depth", null: false
    t.integer "height_frame_depth", null: false
    t.integer "flat_bar_size"
    t.string "remark"
    t.bigint "site_memo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_memo_id"], name: "index_inner_sashes_on_site_memo_id"
  end

  create_table "one_time_authentications", force: :cascade do |t|
    t.integer "function_name", null: false
    t.string "user_key", null: false
    t.string "client_token"
    t.integer "password_length", null: false
    t.string "password_digest", null: false
    t.integer "expires_seconds", null: false
    t.integer "failed_count", default: 0, null: false
    t.integer "max_authenticate_password_count", default: 3, null: false
    t.datetime "authenticated_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_key"], name: "index_one_time_authentications_on_user_key"
  end

  create_table "site_memos", force: :cascade do |t|
    t.string "room", limit: 15, null: false
    t.bigint "construction_kind_id", null: false
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["construction_kind_id"], name: "index_site_memos_on_construction_kind_id"
    t.index ["site_id"], name: "index_site_memos_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "address", limit: 50, null: false
    t.date "research_date"
    t.time "research_start_time"
    t.date "construction_date"
    t.time "construction_start_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contractor_id", null: false
    t.index ["contractor_id"], name: "index_sites_on_contractor_id"
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "name", limit: 15, null: false
    t.string "uid"
    t.string "provider"
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contractors", "users"
  add_foreign_key "inner_sashes", "site_memos"
  add_foreign_key "site_memos", "construction_kinds"
  add_foreign_key "site_memos", "sites"
  add_foreign_key "sites", "contractors"
  add_foreign_key "sites", "users"
end
