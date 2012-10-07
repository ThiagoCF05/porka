class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome, :limit => 80, :null => false
      t.integer :estado_id, :null => false
      t.timestamps
    end
  end
end
