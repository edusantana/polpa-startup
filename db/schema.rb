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

ActiveRecord::Schema.define(version: 20171018123900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encomendas", force: :cascade do |t|
    t.string "responsavel"
    t.string "celular"
    t.string "endereco"
    t.string "observacao"
    t.bigint "lote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.float "frete"
    t.index ["lote_id"], name: "index_encomendas_on_lote_id"
  end

  create_table "lotes", force: :cascade do |t|
    t.date "data"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedido_produtos", force: :cascade do |t|
    t.bigint "produto_id"
    t.bigint "pedido_id"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_pedido_produtos_on_pedido_id"
    t.index ["produto_id"], name: "index_pedido_produtos_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "encomenda_id"
    t.string "nome"
    t.string "celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encomenda_id"], name: "index_pedidos_on_encomenda_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.integer "quantidade"
    t.float "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lote_id"
    t.index ["lote_id"], name: "index_produtos_on_lote_id"
  end

  add_foreign_key "encomendas", "lotes"
  add_foreign_key "pedido_produtos", "pedidos"
  add_foreign_key "pedido_produtos", "produtos"
  add_foreign_key "pedidos", "encomendas"
  add_foreign_key "produtos", "lotes"
end
