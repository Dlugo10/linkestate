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

ActiveRecord::Schema.define(version: 2021_03_12_143656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_favorites_on_property_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "price"
    t.string "address"
    t.string "city"
    t.integer "zip_code"
    t.text "neighborhood_info"
    t.string "neighborhood"
    t.integer "sq_meters"
    t.integer "estimated_price"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "sq_meters_land"
    t.integer "year_bought"
    t.integer "price_bought"
    t.integer "sq_meters_added"
    t.integer "year_built"
    t.integer "year_renovated"
    t.float "latitude"
    t.float "longitude"
    t.boolean "beachfront"
    t.boolean "waterfront"
    t.boolean "pool"
    t.string "propery_type"
    t.boolean "central_air"
    t.boolean "dishwasher"
    t.boolean "washing_machine"
    t.boolean "attached_garage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "tax_histories", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.integer "year"
    t.integer "value"
    t.integer "tax"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_tax_histories_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.integer "year_born"
    t.string "gender"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "properties"
  add_foreign_key "favorites", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "tax_histories", "properties"
end
