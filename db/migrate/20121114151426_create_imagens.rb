class CreateImagens < ActiveRecord::Migration
  def change
    create_table :imagens do |t|
      t.integer :imageble_id, :limit => 8, :null => false
      t.string :imageble_type
      t.timestamps
    end
  end
end
