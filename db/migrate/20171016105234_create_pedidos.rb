class CreatePedidos < ActiveRecord::Migration[5.1]
  def change
    create_table :pedidos do |t|
      t.references :encomenda, foreign_key: true
      t.string :nome
      t.string :celular

      t.timestamps
    end
  end
end
