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

ActiveRecord::Schema.define(version: 20141030203205) do

  create_table "cuentadantes", force: true do |t|
    t.string   "nombre"
    t.integer  "tipo_doc_id"
    t.integer  "documento"
    t.integer  "cantidad_elementos"
    t.string   "nombre_elementos"
    t.string   "valor_elementos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuentadantes", ["tipo_doc_id"], name: "index_cuentadantes_on_tipo_doc_id"

  create_table "elementos", force: true do |t|
    t.integer  "placa"
    t.integer  "tipo_elem_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "modelo"
    t.string   "serial"
    t.datetime "fecha_adquisicion"
    t.integer  "valor"
    t.boolean  "estado"
    t.integer  "cuentadante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "elementos", ["cuentadante_id"], name: "index_elementos_on_cuentadante_id"
  add_index "elementos", ["tipo_elem_id"], name: "index_elementos_on_tipo_elem_id"

  create_table "tipo_docs", force: true do |t|
    t.string   "sigla"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_elems", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
