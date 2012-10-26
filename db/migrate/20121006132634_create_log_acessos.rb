class CreateLogAcessos < ActiveRecord::Migration
  def change
    create_table :log_acessos, :id => false do |t|
      t.integer :usuario_id, :limit => 8, :null => false
      t.timestamps
    end
  end
end
