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

ActiveRecord::Schema[7.1].define(version: 2023_10_27_130929) do
  create_table "organizations", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "code", limit: 250
    t.string "name"
    t.string "description"
  end

  create_table "permissions", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "user_id", unsigned: true
    t.integer "organization_id", unsigned: true
    t.string "network", limit: 20
    t.integer "authlevel"
    t.index ["organization_id"], name: "fk_organization_permission"
    t.index ["user_id"], name: "fk_user_permission"
  end

  create_table "printer_models", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "vendor_id", null: false, unsigned: true
    t.string "name"
    t.boolean "laser"
    t.index ["vendor_id"], name: "vendor_id"
  end

  create_table "printer_models_toner_models", id: false, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "printer_model_id", null: false, unsigned: true
    t.integer "toner_model_id", null: false, unsigned: true
    t.index ["printer_model_id"], name: "printer_model_id"
    t.index ["toner_model_id"], name: "toner_model_id"
  end

  create_table "printers", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "organization_id", unsigned: true
    t.integer "printer_model_id", unsigned: true
    t.string "name"
    t.text "description"
    t.boolean "rent"
    t.index ["organization_id"], name: "organization_id"
    t.index ["printer_model_id"], name: "printer_model_id"
  end

  create_table "toner_models", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "vendor_id", null: false, unsigned: true
    t.string "name"
    t.boolean "compatible"
    t.index ["vendor_id"], name: "vendor_id"
  end

  create_table "toners", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "organization_id", unsigned: true
    t.integer "toner_model_id", unsigned: true
    t.integer "number", default: 0, unsigned: true
    t.boolean "gift"
    t.index ["organization_id"], name: "organization_id"
    t.index ["toner_model_id"], name: "toner_model_id"
  end

  create_table "users", id: { type: :integer, unsigned: true, default: nil }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "upn"
    t.string "email"
    t.string "name"
    t.string "surname"
    t.timestamp "updated_at", default: -> { "current_timestamp() ON UPDATE current_timestamp()" }, null: false
    t.index ["upn"], name: "index_users_on_upn"
  end

  create_table "vendors", id: { type: :integer, unsigned: true }, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "permissions", "organizations", name: "fk_organization_permission"
  add_foreign_key "permissions", "users", name: "fk_user_permission"
  add_foreign_key "printer_models", "vendors", name: "printer_models_ibfk_1"
  add_foreign_key "printer_models_toner_models", "printer_models", name: "printer_models_toner_models_ibfk_1"
  add_foreign_key "printer_models_toner_models", "toner_models", name: "printer_models_toner_models_ibfk_2"
  add_foreign_key "printers", "organizations", name: "printers_ibfk_1"
  add_foreign_key "printers", "printer_models", name: "printers_ibfk_2"
  add_foreign_key "toner_models", "vendors", name: "toner_models_ibfk_1"
  add_foreign_key "toners", "organizations", name: "toners_ibfk_1"
  add_foreign_key "toners", "toner_models", name: "toners_ibfk_2"
end
