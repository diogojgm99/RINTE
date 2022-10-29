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

ActiveRecord::Schema[7.0].define(version: 2022_10_29_193324) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "flag_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.boolean "flag_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.boolean "flag_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "reference"
    t.integer "quantity"
    t.float "price_unit"
    t.integer "color_id", null: false
    t.integer "material_id", null: false
    t.boolean "flag_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_items_on_color_id"
    t.index ["material_id"], name: "index_items_on_material_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.boolean "flag_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.integer "country_id", null: false
    t.integer "city_id", null: false
    t.boolean "flag_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["country_id"], name: "index_users_on_country_id"
  end

  add_foreign_key "items", "colors"
  add_foreign_key "items", "materials"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "countries"
end
