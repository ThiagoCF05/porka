class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.string :nome, :limit => 50
      t.string :senha
      t.string :username
      t.string :email, :limit => 80, :null => false
      t.datetime :data_cadastro
      t.datetime :date_nascimento
      t.string :tipo_pessoa, :limit => 1
      t.integer :documento, :limit => 8
      t.string :sexo, :limit => 1
      t.integer :status_id, :null => false
      t.string :type
      t.timestamps
    end
  end
  
  def self.down
    drop_table :usuarios
  end
end
