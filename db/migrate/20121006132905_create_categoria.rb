class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :nome, :limit => 80, :null => false
      t.text :descricao
      t.string :status, :limit => 1, :null => false
      t.timestamps
    end
  end
end
