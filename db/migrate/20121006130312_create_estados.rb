class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nome, :limit => 80, :null => false
      t.timestamps
    end
  end
end
