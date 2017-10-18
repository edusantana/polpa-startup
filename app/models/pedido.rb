class Pedido < ApplicationRecord
  belongs_to :encomenda
  has_many :pedido_produtos

  def total
    
    soma = 0
    pedido_produtos.each do |pp|
      soma += pp.valor
    end
    soma
  end

end
