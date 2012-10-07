class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :usuario_id, :limit => 8
      t.integer :cooperativa_id, :limit => 8
      t.integer :ddd, :null => false
      t.integer :numero, :null => false
      t.string :tipo, :limit => 1
      t.timestamps
    end
  end
end
