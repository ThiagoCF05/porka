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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121107134555) do

  create_table "categorias", :force => true do |t|
    t.string   "nome",       :limit => 80, :null => false
    t.text     "descricao"
    t.integer  "status_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string   "nome",       :limit => 80, :null => false
    t.integer  "estado_id",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", :force => true do |t|
    t.string   "nome",            :limit => 50
    t.string   "senha",                         :null => false
    t.string   "username"
    t.string   "email",           :limit => 80, :null => false
    t.datetime "date_nascimento"
    t.string   "tipo_pessoa",     :limit => 1
    t.integer  "documento",       :limit => 8
    t.string   "sexo",            :limit => 1
    t.integer  "status_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cotacaos", :force => true do |t|
    t.integer  "cooperativa_id", :limit => 8, :null => false
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.float    "valor",                       :null => false
    t.text     "descricao"
    t.string   "tipo",                        :null => false
    t.integer  "status_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destaques", :force => true do |t|
    t.integer  "oferta_id",  :limit => 8, :null => false
    t.integer  "status_id",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enderecos", :force => true do |t|
    t.integer  "enderecavel_id",   :limit => 8,  :null => false
    t.string   "enderecavel_type"
    t.integer  "cidade_id",        :limit => 8,  :null => false
    t.string   "rua",                            :null => false
    t.string   "bairro",                         :null => false
    t.integer  "cep",                            :null => false
    t.integer  "numero"
    t.string   "complemento",      :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nome",       :limit => 80, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imagens", :id => false, :force => true do |t|
    t.integer  "id",            :limit => 8, :null => false
    t.integer  "imageble_id",   :limit => 8, :null => false
    t.string   "imageble_type"
    t.string   "alias"
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "log_acessos", :force => true do |t|
    t.integer  "usuario_id", :limit => 8, :null => false
    t.integer  "cliente_id", :limit => 8, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ofertas", :force => true do |t|
    t.integer  "cotacao_id",                :limit => 8, :null => false
    t.integer  "administrador_id",          :limit => 8, :null => false
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "total_vendas",                           :null => false
    t.float    "valor_convite",                          :null => false
    t.float    "valor_convite_promocional"
    t.float    "porcentagem_instituicao",                :null => false
    t.integer  "status_id",                              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pagamentos", :force => true do |t|
    t.integer  "cliente_id",        :limit => 8, :null => false
    t.integer  "oferta_id",         :limit => 8, :null => false
    t.integer  "log_acesso_id",     :limit => 8, :null => false
    t.float    "valor",                          :null => false
    t.integer  "quantidade_cupons",              :null => false
    t.string   "forma_pagamento",   :limit => 1, :null => false
    t.integer  "documento",                      :null => false
    t.integer  "status_id",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.integer  "cooperativa_id",  :limit => 8,  :null => false
    t.integer  "subcategoria_id",               :null => false
    t.string   "nome",            :limit => 80, :null => false
    t.text     "descricao"
    t.integer  "status_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "codigo",     :limit => 2, :null => false
    t.string   "descricao",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategorias", :force => true do |t|
    t.integer  "categoria_id",               :null => false
    t.string   "nome",         :limit => 80, :null => false
    t.text     "descricao"
    t.integer  "status_id",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telefones", :force => true do |t|
    t.integer  "telefonavel_id",   :limit => 8, :null => false
    t.string   "telefonavel_type"
    t.integer  "ddd",                           :null => false
    t.integer  "numero",                        :null => false
    t.string   "tipo",             :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome",            :limit => 50
    t.string   "senha"
    t.string   "username"
    t.string   "email",           :limit => 80, :null => false
    t.datetime "data_nascimento"
    t.string   "tipo_pessoa",     :limit => 1
    t.integer  "documento",       :limit => 8
    t.string   "sexo",            :limit => 1
    t.integer  "status_id",                     :null => false
    t.text     "descricao"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
