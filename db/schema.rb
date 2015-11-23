# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151117120854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenitis", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "restaurant_feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "restaurant_features"
    t.string   "name"
  end

  create_table "banquet_halls", force: true do |t|
    t.integer  "capacity_of_guest"
    t.string   "category"
    t.float    "price"
    t.string   "description"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_tables", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "contact1"
    t.string   "contact2"
    t.string   "email"
    t.date     "booking_date"
    t.time     "booking_time"
    t.integer  "no_of_guest"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisine_types", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines", force: true do |t|
    t.string   "name"
    t.integer  "cuisine_type_id"
    t.text     "description"
    t.boolean  "status"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "is_veg"
    t.boolean  "is_nonveg"
    t.boolean  "is_swaminarayan"
    t.boolean  "is_jain"
    t.float    "price"
    t.boolean  "is_subcategory"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact1"
    t.string   "contact2"
    t.string   "address1"
    t.string   "address2"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.boolean  "status"
    t.integer  "cuisine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.boolean  "is_veg"
    t.boolean  "is_nonveg"
    t.boolean  "is_swaminarayan"
    t.boolean  "is_jain"
  end

  create_table "restaurant_features", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip_code"
    t.text     "description"
    t.string   "contact1"
    t.string   "contact2"
    t.string   "logo"
    t.boolean  "is_active"
    t.date     "resister_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delay_time"
  end

  create_table "reviews", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "review"
    t.integer  "rating"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", force: true do |t|
    t.string   "code"
    t.integer  "capacity"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min_capacity"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact1"
    t.string   "contact2"
    t.string   "address1"
    t.string   "address2"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zip_code"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
