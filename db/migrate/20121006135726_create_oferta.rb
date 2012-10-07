class CreateOferta < ActiveRecord::Migration
  def change
    create_table :oferta, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :cotacao_id, :limit => 8, :null => false
      t.integer :admin_id, :limit => 8, :null => false
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :total_vendas, :null => false
      t.float :valor_convite, :null => false
      t.float :porcentagem_instituicao, :null => false
      t.string :status, :limit => 1, :null => false
      t.timestamps
    end
  end
end
