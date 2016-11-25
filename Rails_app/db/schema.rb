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

ActiveRecord::Schema.define(version: 20161125025618) do

  create_table "carts", force: :cascade do |t|
    t.text     "products"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "p_nr"
    t.string   "adress"
    t.integer  "zip"
    t.string   "city"
    t.string   "email"
    t.string   "phone_nr"
    t.string   "password"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "cart_id"
    t.string   "adress"
    t.integer  "zip"
    t.string   "city"
    t.boolean  "payed"
    t.boolean  "shipped"
    t.boolean  "order_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cart_id"], name: "index_deliveries_on_cart_id"
    t.index ["customer_id"], name: "index_deliveries_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.integer  "category_id"
    t.float    "price"
    t.integer  "stock"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_products", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_products_on_product_id"
    t.index ["sale_id"], name: "index_sales_products_on_sale_id"
  end

end
