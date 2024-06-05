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

ActiveRecord::Schema[7.1].define(version: 2024_06_05_105004) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "products", force: :cascade do |t|
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
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["rank_id"], name: "index_products_on_rank_id"
    t.index ["starting_price_id"], name: "index_products_on_starting_price_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ranks_on_user_id"
  end

  create_table "starting_prices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_starting_prices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "zip_code"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.date "birth_day"
    t.string "line_name"
    t.string "line_id"
    t.string "business_license_front"
    t.string "business_license_back"
    t.string "document_front"
    t.string "document_back"
    t.string "id_login"
    t.string "password"
    t.string "delivery_person_name"
    t.string "delivery_phone_number"
    t.string "delivery_zip_code"
    t.string "delivery_address"
    t.string "product_detail_template1"
    t.string "product_detail_template2"
    t.string "product_detail_template3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "brands", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "ranks"
  add_foreign_key "products", "starting_prices"
  add_foreign_key "ranks", "users"
  add_foreign_key "starting_prices", "users"
end
