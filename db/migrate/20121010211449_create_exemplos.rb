class CreateExemplos < ActiveRecord::Migration
  def change
    create_table :exemplos do |t|
      t.string :nome
      t.integer :idade

      t.timestamps
    end
  end
end
