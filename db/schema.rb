# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_045236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_controls", force: :cascade do |t|
    t.integer "code"
    t.bigint "concept_id", null: false
    t.bigint "theme_id", null: false
    t.bigint "type_id", null: false
    t.bigint "item_id", null: false
    t.date "start_date"
    t.date "final_date"
    t.integer "tracking_type"
    t.integer "state"
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.integer "responsible"
    t.integer "support"
    t.integer "advance"
    t.text "process"
    t.string "link_process"
    t.string "link_drive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "enable"
    t.bigint "responsible_function_id", null: false
    t.bigint "user_id"
    t.index ["city_id"], name: "index_admin_controls_on_city_id"
    t.index ["company_id"], name: "index_admin_controls_on_company_id"
    t.index ["concept_id"], name: "index_admin_controls_on_concept_id"
    t.index ["item_id"], name: "index_admin_controls_on_item_id"
    t.index ["responsible_function_id"], name: "index_admin_controls_on_responsible_function_id"
    t.index ["theme_id"], name: "index_admin_controls_on_theme_id"
    t.index ["type_id"], name: "index_admin_controls_on_type_id"
    t.index ["user_id"], name: "index_admin_controls_on_user_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.boolean "enable"
    t.string "identification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "concepts", force: :cascade do |t|
    t.string "name"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "designations", force: :cascade do |t|
    t.string "code"
    t.string "activity"
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_designations_on_area_id"
  end

  create_table "engineers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.boolean "enable"
    t.bigint "profile_id", null: false
    t.integer "profile_two"
    t.integer "profile_three"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_engineers_on_profile_id"
  end

  create_table "has_engineers", force: :cascade do |t|
    t.bigint "designation_id", null: false
    t.bigint "engineer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["designation_id"], name: "index_has_engineers_on_designation_id"
    t.index ["engineer_id"], name: "index_has_engineers_on_engineer_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "modalities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "enable", default: true
  end

  create_table "offers", force: :cascade do |t|
    t.integer "code"
    t.bigint "worker_id", null: false
    t.bigint "modality_id", null: false
    t.string "status"
    t.datetime "publication_date"
    t.datetime "date_submission_obs"
    t.integer "remaining_hour_obs"
    t.integer "remaining_days_obs"
    t.string "status_obs"
    t.bigint "city_id", null: false
    t.bigint "company_id", null: false
    t.decimal "presented_value"
    t.decimal "budget_value"
    t.string "official_page"
    t.string "email_company"
    t.string "email_alternative"
    t.string "link_document"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date_publication_observations_report"
    t.integer "remaining_day_obs_report"
    t.integer "remaining_hour_obs_report"
    t.string "status_obs_report"
    t.datetime "date_deadline_submission_offers"
    t.integer "remaining_day_submission_offers"
    t.integer "remaining_hour_submission_offers"
    t.string "status_submission_offers"
    t.datetime "date_offer_evaluation_report"
    t.integer "remaining_day_offer_evaluation_report"
    t.integer "remaining_hour_offer_evaluation_report"
    t.string "status_offer_evaluation_report"
    t.datetime "date_obs_offer_evaluation_report"
    t.integer "remaining_day_obs_offer_evaluation_report"
    t.integer "remaining_hour_obs_offer_evaluation_report"
    t.string "status_obs_offer_evaluation_report"
    t.datetime "date_acceptance_offers"
    t.integer "remaining_day_acceptance_offers"
    t.integer "remaining_hour_acceptance_offers"
    t.string "status_acceptance_offers"
    t.index ["city_id"], name: "index_offers_on_city_id"
    t.index ["company_id"], name: "index_offers_on_company_id"
    t.index ["modality_id"], name: "index_offers_on_modality_id"
    t.index ["worker_id"], name: "index_offers_on_worker_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.boolean "enable", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "editable", default: true
    t.integer "profile_type"
  end

  create_table "responsible_functions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "annexed"
  end

  create_table "type_identifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.boolean "enable"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "phone_2"
    t.string "email"
    t.bigint "profile_id", null: false
    t.integer "profile_2"
    t.integer "profile_3"
    t.integer "profile_4"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "identification"
    t.bigint "type_identification_id", null: false
    t.boolean "enable", default: true
    t.index ["profile_id"], name: "index_workers_on_profile_id"
    t.index ["type_identification_id"], name: "index_workers_on_type_identification_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_controls", "cities"
  add_foreign_key "admin_controls", "companies"
  add_foreign_key "admin_controls", "concepts"
  add_foreign_key "admin_controls", "items"
  add_foreign_key "admin_controls", "responsible_functions"
  add_foreign_key "admin_controls", "themes"
  add_foreign_key "admin_controls", "types"
  add_foreign_key "admin_controls", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "designations", "areas"
  add_foreign_key "engineers", "profiles"
  add_foreign_key "has_engineers", "designations"
  add_foreign_key "has_engineers", "engineers"
  add_foreign_key "offers", "cities"
  add_foreign_key "offers", "companies"
  add_foreign_key "offers", "modalities"
  add_foreign_key "offers", "workers"
  add_foreign_key "workers", "profiles"
  add_foreign_key "workers", "type_identifications"
end
