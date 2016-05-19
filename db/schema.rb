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

ActiveRecord::Schema.define(version: 0) do

  create_table "admins", force: :cascade do |t|
    t.integer "user_id",         limit: 4
    t.integer "organization_id", limit: 4
    t.integer "authlevel",       limit: 4
  end

  add_index "admins", ["user_id"], name: "userid", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string "name",        limit: 255
    t.string "description", limit: 255
  end

  create_table "printer_models", force: :cascade do |t|
    t.integer "vendor_id", limit: 4,   null: false
    t.string  "name",      limit: 255
    t.boolean "laser"
    t.boolean "rent"
  end

  add_index "printer_models", ["vendor_id"], name: "vendor_id", using: :btree

  create_table "printer_models_toner_models", id: false, force: :cascade do |t|
    t.integer "printer_model_id", limit: 4, null: false
    t.integer "toner_model_id",   limit: 4, null: false
  end

  add_index "printer_models_toner_models", ["printer_model_id"], name: "printer_model_id", using: :btree
  add_index "printer_models_toner_models", ["toner_model_id"], name: "toner_model_id", using: :btree

  create_table "printers", force: :cascade do |t|
    t.integer "organization_id",  limit: 4
    t.integer "printer_model_id", limit: 4
    t.string  "name",             limit: 255
    t.text    "description",      limit: 65535
  end

  add_index "printers", ["organization_id"], name: "organization_id", using: :btree
  add_index "printers", ["printer_model_id"], name: "printer_model_id", using: :btree

  create_table "toner_models", force: :cascade do |t|
    t.integer "vendor_id",  limit: 4,   null: false
    t.string  "name",       limit: 255
    t.boolean "compatible"
  end

  add_index "toner_models", ["vendor_id"], name: "vendor_id", using: :btree

  create_table "toners", force: :cascade do |t|
    t.integer "organization_id", limit: 4
    t.integer "toner_model_id",  limit: 4
    t.integer "number",          limit: 4, default: 0
    t.boolean "gift"
  end

  add_index "toners", ["organization_id"], name: "organization_id", using: :btree
  add_index "toners", ["toner_model_id"], name: "toner_model_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "upn",        limit: 255
    t.string   "email",      limit: 255
    t.string   "name",       limit: 255
    t.string   "surname",    limit: 255
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["upn"], name: "index_users_on_upn", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string "name", limit: 255
  end

  add_foreign_key "printer_models", "vendors", name: "printer_models_ibfk_1"
  add_foreign_key "printer_models_toner_models", "printer_models", name: "printer_models_toner_models_ibfk_1"
  add_foreign_key "printer_models_toner_models", "toner_models", name: "printer_models_toner_models_ibfk_2"
  add_foreign_key "printers", "organizations", name: "printers_ibfk_1"
  add_foreign_key "printers", "printer_models", name: "printers_ibfk_2"
  add_foreign_key "toner_models", "vendors", name: "toner_models_ibfk_1"
  add_foreign_key "toners", "organizations", name: "toners_ibfk_1"
  add_foreign_key "toners", "toner_models", name: "toners_ibfk_2"
end
