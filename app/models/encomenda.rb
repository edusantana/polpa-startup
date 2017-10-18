class Encomenda < ApplicationRecord
  belongs_to :lote
  has_many :pedidos
  has_many :pedido_produtos, :through => :pedidos

  def total
    soma = 0
    pedido_produtos.each do |pp|
      soma += pp.valor
    end

    soma
  end

end
