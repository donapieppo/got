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

  create_table "admins", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", unsigned: true
    t.integer "organization_id", unsigned: true
    t.integer "authlevel"
    t.index ["user_id"], name: "userid"
  end

  create_table "organizations", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "printer_models", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "vendor_id", null: false, unsigned: true
    t.string "name"
    t.boolean "laser"
    t.index ["vendor_id"], name: "vendor_id"
  end

  create_table "printer_models_toner_models", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "printer_model_id", null: false, unsigned: true
    t.integer "toner_model_id", null: false, unsigned: true
    t.index ["printer_model_id"], name: "printer_model_id"
    t.index ["toner_model_id"], name: "toner_model_id"
  end

  create_table "printers", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "organization_id", unsigned: true
    t.integer "printer_model_id", unsigned: true
    t.string "name"
    t.text "description"
    t.boolean "rent"
    t.index ["organization_id"], name: "organization_id"
    t.index ["printer_model_id"], name: "printer_model_id"
  end

  create_table "toner_models", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "vendor_id", null: false, unsigned: true
    t.string "name"
    t.boolean "compatible"
    t.index ["vendor_id"], name: "vendor_id"
  end

  create_table "toners", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "organization_id", unsigned: true
    t.integer "toner_model_id", unsigned: true
    t.integer "number", default: 0, unsigned: true
    t.boolean "gift"
    t.index ["organization_id"], name: "organization_id"
    t.index ["toner_model_id"], name: "toner_model_id"
  end

  create_table "users", id: :integer, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "upn"
    t.string "email"
    t.string "name"
    t.string "surname"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["upn"], name: "index_users_on_upn"
  end

  create_table "vendors", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
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
