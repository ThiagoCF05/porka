class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :usuario_id, :limit => 8
      t.integer :cooperativa_id
      t.integer :subcategoria_id
      t.string :nome, :limit => 80, :null => false
      t.text :descricao
      t.string :status, :limit => 1, :null => false
      t.timestamps
    end
  end
end
