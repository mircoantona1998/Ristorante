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

ActiveRecord::Schema[7.2].define(version: 2024_10_14_133447) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brought_ingredients", force: :cascade do |t|
    t.bigint "brought_id", null: false
    t.bigint "ingredient_id", null: false
    t.float "quantita"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["brought_id"], name: "index_brought_ingredients_on_brought_id"
    t.index ["ingredient_id"], name: "index_brought_ingredients_on_ingredient_id"
  end

  create_table "broughts", force: :cascade do |t|
    t.string "nome"
    t.decimal "prezzo"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "nome"
    t.float "giacenza"
    t.string "unita_di_misura"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "order_broughts", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "brought_id", null: false
    t.float "quantita"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["brought_id"], name: "index_order_broughts_on_brought_id"
    t.index ["order_id"], name: "index_order_broughts_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "numero"
    t.integer "posti"
    t.boolean "disponibile"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  add_foreign_key "brought_ingredients", "broughts"
  add_foreign_key "brought_ingredients", "ingredients"
  add_foreign_key "order_broughts", "broughts"
  add_foreign_key "order_broughts", "orders"
  add_foreign_key "orders", "tables"
end
