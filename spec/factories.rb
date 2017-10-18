# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
# This will guess the User class
FactoryGirl.define do
  
  sequence :produto_nome do |n|
    "Polpa da fruta #{n}"
  end

  factory :lote do
    ativo true
    data Time.now
  end

  # This will use the User class (Admin would have been guessed)
  factory :produto do
    nome {generate(:produto_nome)}
    quantidade 25
    sequence(:valor, 8)
    lote
  end

  factory :encomenda do
    lote
    responsavel 'Alberto'
    celular '83988040125'
    endereco 'Rua Imaginária dos Santos Silva'
    uuid SecureRandom.uuid
    frete 5.0
  end

  factory :pedido do
    encomenda
    sequence :nome do |n|
      "Nome do amigo(a) #{n}"
    end
    celular {"839#{(rand * 100000000).to_i.to_s.ljust(8, '0')}"}
  end
  
  factory :pedido_produto do
    produto nil
    pedido nil
    quantidade 0
  end


end