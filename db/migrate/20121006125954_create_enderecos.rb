class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :usuario_id, :limit => 8
      t.integer :cooperativa_id, :limit => 8
      t.integer :cidade_id, :limit => 8, :null => false
      t.string :rua, :null => false
      t.string :bairro, :null => false
      t.integer :cep, :null => false
      t.integer :numero
      t.string :complemento, :limit => 20
      t.timestamps
    end
  end
end
