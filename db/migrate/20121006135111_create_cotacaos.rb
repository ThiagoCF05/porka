class CreateCotacaos < ActiveRecord::Migration
  def change
    create_table :cotacaos, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :cooperativa_id, :limit => 8, :null => false
      t.integer :produto_id, :limit => 8, :null => false
      t.datetime :data_inicio
      t.datetime :data_fim
      t.float :valor, :null => false
      t.text :descricao
      t.string :tipo, :null => false
      t.integer :status_id, :null => false
      t.timestamps
    end
  end
end
