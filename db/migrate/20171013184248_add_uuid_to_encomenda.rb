class AddUuidToEncomenda < ActiveRecord::Migration[5.1]
  def change
    add_column :encomendas, :uuid, :string
  end
end
