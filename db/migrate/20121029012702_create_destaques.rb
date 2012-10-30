class CreateDestaques < ActiveRecord::Migration
  def change
    create_table :destaques, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :oferta_id, :limit => 8, :null => false
      t.datetime :data_inicio
      t.datetime :data_final
      t.timestamps
    end
  end
end
