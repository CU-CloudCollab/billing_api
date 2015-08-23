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

ActiveRecord::Schema.define(version: 20150823154242) do

  create_table "billing_detail", id: false, force: :cascade do |t|
    t.string   "invoice_id",        limit: 255
    t.string   "payer_account_id",  limit: 255
    t.string   "linked_account_id", limit: 255
    t.string   "record_type",       limit: 255
    t.string   "record_id",         limit: 255
    t.string   "product_name",      limit: 255
    t.string   "rate_id",           limit: 255
    t.string   "subscription_id",   limit: 255
    t.string   "pricing_plan_id",   limit: 255
    t.string   "usage_type",        limit: 255
    t.string   "operation",         limit: 255
    t.string   "availability_zone", limit: 255
    t.string   "reserved_instance", limit: 255
    t.string   "item_description",  limit: 255
    t.datetime "usage_start_date"
    t.datetime "usage_end_date"
    t.float    "usage_quantity",    limit: 24
    t.float    "blended_rate",      limit: 24
    t.float    "blended_cost",      limit: 24
    t.float    "unblended_rate",    limit: 24
    t.float    "unblended_cost",    limit: 24
    t.string   "resource_id",       limit: 255
    t.string   "cost_center",       limit: 255
  end

  create_table "current_month", id: false, force: :cascade do |t|
    t.string "invoice_id",        limit: 25
    t.string "payer_account_id",  limit: 25
    t.string "linked_account_id", limit: 25
    t.string "record_type",       limit: 50
    t.string "record_id",         limit: 100
    t.string "product_name",      limit: 100
    t.string "rate_id",           limit: 25
    t.string "subscription_id",   limit: 25
    t.string "pricing_plan_id",   limit: 25
    t.string "usage_type",        limit: 255
    t.string "operation",         limit: 100
    t.string "availability_zone", limit: 25
    t.string "reserved_instance", limit: 255
    t.string "item_description",  limit: 255
    t.string "usage_start_date",  limit: 255
    t.string "usage_end_date",    limit: 255
    t.string "usage_quantity",    limit: 255
    t.string "blended_rate",      limit: 255
    t.string "blended_cost",      limit: 255
    t.string "unblended_rate",    limit: 255
    t.string "unblended_cost",    limit: 255
    t.string "resource_id",       limit: 100
    t.string "cost_center",       limit: 255
  end

  create_table "user", force: :cascade do |t|
    t.string   "api_key"
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_account", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "account_num"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
