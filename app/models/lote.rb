class Lote < ApplicationRecord
  has_many :produtos
  has_many :encomendas

  accepts_nested_attributes_for :produtos
  
end
