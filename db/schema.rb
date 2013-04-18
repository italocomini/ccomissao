# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090226020413) do

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "telefone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comissaos", :force => true do |t|
    t.integer  "venda_id"
    t.date     "data"
    t.integer  "apolice"
    t.integer  "parcela"
    t.float    "recebido"
    t.float    "cancelado"
    t.float    "retido"
    t.float    "comissao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retiradas", :force => true do |t|
    t.integer  "user_id"
    t.date     "data_retirada"
    t.float    "valor_retirada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  create_table "seguradoras", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :limit => 60,  :default => "",   :null => false
    t.string   "username",        :limit => 64,  :default => "",   :null => false
    t.string   "email",           :limit => 128, :default => "",   :null => false
    t.string   "hashed_password", :limit => 64
    t.boolean  "enabled",                        :default => true, :null => false
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "vendas", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "seguradora_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
