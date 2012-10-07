class CreateSubcategoria < ActiveRecord::Migration
  def change
    create_table :subcategoria do |t|
      t.integer :categoria_id, :null => false
      t.string :nome, :limit => 80, :null => false
      t.text :descricao
      t.string :status, :limit => 1, :null => false
      t.timestamps
    end
  end
end
