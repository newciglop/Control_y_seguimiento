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

ActiveRecord::Schema.define(version: 2021_02_08_050038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
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

  create_table "modalities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.boolean "enable", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "editable", default: true
    t.integer "profile_type"
  end

  add_foreign_key "designations", "areas"
  add_foreign_key "engineers", "profiles"
  add_foreign_key "has_engineers", "designations"
  add_foreign_key "has_engineers", "engineers"
end
