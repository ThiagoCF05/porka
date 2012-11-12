class CreateOfertas < ActiveRecord::Migration
  def change
    create_table :ofertas, :id => false do |t|
      t.integer :id, :limit => 8, :null => false
      t.integer :cotacao_id, :limit => 8, :null => false
      t.integer :administrador_id, :limit => 8, :null => false
      t.string :nome, :limit => 60
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :total_vendas, :null => false
      t.float :valor_convite, :null => false
      t.float :valor_convite_promocional
      t.float :porcentagem_instituicao, :null => false
      t.integer :status_id, :null => false
      t.timestamps
    end
  end
end
