class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :codigo, :limit => 2, :null => false
      t.string :descricao, :null => false
      t.timestamps
    end
  end
end
