class AddLoteToProduto < ActiveRecord::Migration[5.1]
  def change
    add_reference :produtos, :lote, foreign_key: true
  end
end
