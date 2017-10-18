class AddFreteToEncomenda < ActiveRecord::Migration[5.1]
  def change
    add_column :encomendas, :frete, :float
  end
end
