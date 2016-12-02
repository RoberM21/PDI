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

ActiveRecord::Schema.define(version: 20161202002451) do

  create_table "areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "company",             limit: 255
    t.string   "contacto",            limit: 255
    t.string   "telefono",            limit: 255
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.string   "marca",      limit: 255
    t.string   "tipo",       limit: 255
    t.string   "garantia",   limit: 255
    t.date     "entrada"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "client_id",  limit: 4
  end

  create_table "incidences", force: :cascade do |t|
    t.string   "prioridad",    limit: 255
    t.string   "estado",       limit: 255
    t.text     "comentario",   limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "area_id",      limit: 4
    t.integer  "service_id",   limit: 4
    t.integer  "technical_id", limit: 4
    t.integer  "client_id",    limit: 4
  end

  create_table "services", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "prioridad",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "area_id",    limit: 4
    t.time     "resolucion"
    t.time     "respuesta"
  end

  create_table "technicals", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.boolean  "ststus"
    t.time     "horaE"
    t.time     "horaS"
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "area_id",             limit: 4
    t.integer  "client_id",           limit: 4
  end

  add_index "technicals", ["user_id"], name: "index_technicals_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "token",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "email_confirmed"
    t.boolean  "confirm_token"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "rol",             limit: 255
  end

  add_foreign_key "clients", "users"
  add_foreign_key "technicals", "users"
end
