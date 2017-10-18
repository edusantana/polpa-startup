class CreateEncomendas < ActiveRecord::Migration[5.1]
  def change
    create_table :encomendas do |t|
      t.string :responsavel
      t.string :celular
      t.string :endereco
      t.string :observacao
      t.references :lote, foreign_key: true

      t.timestamps
    end
  end
end
