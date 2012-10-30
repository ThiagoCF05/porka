class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.string :nome, :limit => 50
      t.string :senha
      t.string :username
      t.string :email, :limit => 80, :null => false
      t.datetime :date_nascimento
      t.string :tipo_pessoa, :limit => 1
      t.integer :documento, :limit => 8
      t.string :sexo, :limit => 1
      t.string :status, :limit => 1, :null => false
      t.timestamps
    end
  end
end
