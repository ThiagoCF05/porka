class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.integer :telefonavel_id, :limit => 8, :null => false
      t.string :telefonavel_type
      t.integer :ddd, :null => false
      t.integer :numero, :null => false
      t.string :tipo, :limit => 1
      t.timestamps
    end
  end
end
