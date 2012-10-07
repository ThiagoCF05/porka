class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :usuario_id, :limit => 8, :null => false
      t.integer :oferta_id, :limit => 8, :null => false
      t.integer :log_acesso_id, :limit => 8, :null => false
      t.float :valor, :null => false
      t.integer :quantidade_cupons, :null => false
      t.string :forma_pagamento, :limit => 1, :null => false
      t.integer :documento, :null => false
      t.string :status, :limit => 1, :null => false
      t.timestamps
    end
  end
end
