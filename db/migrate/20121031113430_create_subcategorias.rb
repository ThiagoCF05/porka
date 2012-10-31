class CreateSubcategorias < ActiveRecord::Migration
  def change
    create_table :subcategorias do |t|
      t.integer :categoria_id, :null => false
      t.string :nome, :limit => 80, :null => false
      t.text :descricao
      t.integer :status_id, :null => false
      t.timestamps
    end
  end
end
