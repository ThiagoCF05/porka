class CreateDestaques < ActiveRecord::Migration
  def change
    create_table :destaques, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :oferta_id, :limit => 8, :null => false
      t.integer :status_id, :null => false
      t.timestamps
    end
  end
end
