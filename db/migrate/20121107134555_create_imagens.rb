class CreateImagens < ActiveRecord::Migration
  def change
    create_table :imagens, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :imageble_id, :limit => 8, :null => false
      t.string :imageble_type
      t.string :alias
      t.string :nome
      t.timestamps
    end
  end
end
