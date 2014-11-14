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

ActiveRecord::Schema.define(version: 20141114145945) do

  create_table "cargos", force: true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.boolean  "privilegioVer"
    t.boolean  "privilegioEditar"
    t.boolean  "privilegioEleminar"
    t.boolean  "privilegioCrear"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuentadantes", force: true do |t|
    t.string   "nombre"
    t.integer  "tipo_doc_id"
    t.integer  "documento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cuentadantes", ["tipo_doc_id"], name: "index_cuentadantes_on_tipo_doc_id"

  create_table "elementos", force: true do |t|
    t.string   "placa"
    t.integer  "tipo_elem_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "modelo"
    t.string   "serial"
    t.datetime "fecha_adquisicion"
    t.string   "valor"
    t.boolean  "estado"
    t.integer  "cuentadante_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reintegros", force: true do |t|
    t.integer  "elemento_id"
    t.integer  "cuentadante_id"
    t.datetime "fechaReintegro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reintegros", ["cuentadante_id"], name: "index_reintegros_on_cuentadante_id"
  add_index "reintegros", ["elemento_id"], name: "index_reintegros_on_elemento_id"

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

  create_table "traspasos", force: true do |t|
    t.integer  "elemento_id"
    t.integer  "cuentadante_id"
    t.datetime "fechaTraspaso"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traspasos", ["cuentadante_id"], name: "index_traspasos_on_cuentadante_id"
  add_index "traspasos", ["elemento_id"], name: "index_traspasos_on_elemento_id"

  create_table "users", force: true do |t|
    t.string   "email",             null: false
    t.string   "crypted_password",  null: false
    t.string   "salt",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "tipo_doc_id"
    t.integer  "documento"
    t.integer  "cargo_id"
    t.boolean  "genero"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
