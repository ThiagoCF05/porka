class CreateCategorias < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string :nome, :limit => 80, :null => false
      t.text :descricao
      t.integer :status_id, :null => false
      t.timestamps
    end
  end
end
