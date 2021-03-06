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

ActiveRecord::Schema.define(version: 20170110165907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "secondary_address"
    t.string   "city"
    t.string   "state_abbr"
    t.string   "zip_code"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.string   "image"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
    t.integer  "status",      default: 0
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "item_id"
    t.integer "order_id"
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status",     default: 0
    t.integer "user_id"
    t.date    "updated_at",             null: false
    t.date    "created_at",             null: false
    t.integer "address_id"
    t.index ["address_id"], name: "index_orders_on_address_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "updated_at",                  null: false
    t.datetime "created_at",                  null: false
    t.integer  "role",            default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "items", "categories"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "users"
end
