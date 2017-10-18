class PedidoProduto < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
  has_one :encomenda, through: :pedido

  def valor
    quantidade * produto.valor
  end

end
