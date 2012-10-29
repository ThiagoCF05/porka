class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.integer :enderecavel_id, :limit => 8, :null => false
      t.string :enderecavel_type
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
