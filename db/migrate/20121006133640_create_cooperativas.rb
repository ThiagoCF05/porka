class CreateCooperativas < ActiveRecord::Migration
  def change
    create_table :cooperativas do |t|
      t.string :nome, :limit => 80, :null => false
      t.string :email, :limit => 80, :null => false
      t.string :tipo_pessoa, :limit => 1, :null => false
      t.integer :documento
      t.string :status, :limit => 1
      t.timestamps
    end
  end
end
