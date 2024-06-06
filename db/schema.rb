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

ActiveRecord::Schema[7.1].define(version: 2024_06_06_024424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "product_detail_template1"
    t.string "product_detail_template2"
    t.string "product_detail_template3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_brands_on_admin_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_categories_on_admin_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "category_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "rank_id", null: false
    t.bigint "starting_price_id", null: false
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.text "description"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_products_on_admin_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["rank_id"], name: "index_products_on_rank_id"
    t.index ["starting_price_id"], name: "index_products_on_starting_price_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_ranks_on_admin_id"
  end

  create_table "starting_prices", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_starting_prices_on_admin_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "zip_code"
    t.string "address"
    t.string "phone_number"
    t.date "birth_day"
    t.string "line_name"
    t.string "line_id"
    t.json "business_license_front"
    t.json "business_license_back"
    t.json "document_front"
    t.json "document_back"
    t.string "id_login"
    t.string "delivery_person_name"
    t.string "delivery_phone_number"
    t.string "delivery_zip_code"
    t.string "delivery_address"
    t.string "jti", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brands", "admins"
  add_foreign_key "categories", "admins"
  add_foreign_key "products", "admins"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "ranks"
  add_foreign_key "products", "starting_prices"
  add_foreign_key "ranks", "admins"
  add_foreign_key "starting_prices", "admins"
end
