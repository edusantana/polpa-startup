require 'rails_helper'

RSpec.feature "ClienteCompraPolpas", type: :feature do

  scenario "Visualizando polpas do lote" do
    dado_existe_um_lote_com_produtos
    dado_estamos_na_pagina_do_lote
    entao_os_produtos_do_lote_estao_visiveis
  end

  scenario "Acessando página de realizar encomenda" do
    dado_existe_um_lote_com_produtos
    dado_estamos_na_pagina_do_lote
    quando_clica_no_link_realizar_encomenda
    entao_estamos_na_pagina_de_criacao_de_encomenda
  end

  scenario "Preenchendo campos obrigatórios da encomenda" do
    dado_existe_um_lote_com_produtos
    dado_estamos_na_pagina_do_lote
    quando_clica_no_link_realizar_encomenda
    e_preenche_o_responsavel
    e_preenche_o_endereco
    e_preenche_o_celular
    e_clica_em_criar_encomenda
    entao_encomenda_foi_criada
    entao_existe_link_de_compartilhamento    
  end

  scenario "Selecionando produtos para encomenda" do
    dado_existe_um_lote_com_5_produtos
    e_uma_encomenda_recem_criada
    e_estamos_na_pagina_da_encomenda
    entao_os_precos_dos_produtos_sao_exibidos
    quando_preencher_nome
    e_preenche_o_celular
    e_especificar_quantidade_do_produto({0=>1})
    e_especificar_quantidade_do_produto({1=>0})
    e_especificar_quantidade_do_produto({2=>2})
    e_especificar_quantidade_do_produto({3=>1})
    e_especificar_quantidade_do_produto({4=>0})
#    entao_o_preco_tocal_eh_calculado_e_exibido
    quando_clicar_em_adicionar_pedido
    entao_o_pedido_foi_adicionado_a_encomenda
    e_o_valor_de_cada_pedido_eh_exibido
    e_o_valor_do_frete_eh_exibido
    e_o_preco_total_da_encomenda_eh_exibido
    e_o_botao_finalizar_e_pagar_esta_visivel_e_ativo
  end

  scenario "Encomenda é criada sem pedidos" do
    dado_existe_um_lote_com_5_produtos
    e_uma_encomenda_recem_criada
    e_estamos_na_pagina_da_encomenda
    entao_nao_ha_pedidos_cadastrados
  end

  scenario "Pedidos com quantidade zero não são adicionados à encomenda" do
    dado_existe_um_lote_com_5_produtos
    e_uma_encomenda_recem_criada
    e_estamos_na_pagina_da_encomenda
    quando_preencher_nome
    e_preenche_o_celular
    quando_selecionar_quantidade_de_apenas_um_produto
    quando_clicar_em_adicionar_pedido
    entao_apenas_o_produto_selecionado_sera_listado_nos_pedidos
  end
  

#  dado_no_lote_existe_produto 'Maracujá', 20, 11.0
 # dado_no_lote_existe_produto 'Uva', 25, 9.0
  #dado_no_lote_existe_produto 'Cajá', 12, 8.0
  #quando_especificamos_quantidade_do_produto 'Maracujá', 2
  #quando_especificamos_quantidade_do_produto 'Uva', 3
  #quando_especificamos_quantidade_do_produto 'Cajá', 0


  def dado_existe_um_lote_com_5_produtos
    @lote = FactoryGirl.create(:lote)
    5.times do |n|
      FactoryGirl.create(:produto, lote: @lote)
    end
    @lote.produtos.reload
    @lote.reload
  end

  def dado_existe_um_lote_com_produtos
    @lote = FactoryGirl.create(:lote)
    @maracuja = FactoryGirl.create(:produto, lote: @lote, nome:'pola de maracuja')
    @morango = FactoryGirl.create(:produto, lote: @lote, nome:'pola de morango')
    @lote.produtos.reload
  end

  def e_uma_encomenda_recem_criada
    @encomenda = FactoryGirl.create(:encomenda, lote: @lote)
  end

  def dado_estamos_na_pagina_do_lote
    visit lote_path(@lote)
  end

  def e_estamos_na_pagina_da_encomenda
    visit encomenda_path(@encomenda.id, @encomenda.uuid)
  end

  def entao_os_produtos_do_lote_estao_visiveis
    expect(page).to have_content(@lote.produtos.first.nome)
  end

  def entao_os_precos_dos_produtos_sao_exibidos
    @lote.produtos.each do |produto|
      expect(page).to have_content(produto.valor.to_s(:currency))
    end
  end

  def entao_nao_ha_pedidos_cadastrados
    expect(page).to have_content('Nenhum pedido cadastrado.')
  end

  def entao_existe_link_para_criar_encomenda
    expect(page).to have_content(@lote.produtos.first.nome)
  end

  def entao_existe_link_de_compartilhamento
    expect(page).to have_link('whatsapp_link')
  end

  def quando_clica_no_link_realizar_encomenda
    click_link('Realizar encomenda')    
  end

  def entao_estamos_na_pagina_de_criacao_de_encomenda
    expect(page.current_path).to eq new_lote_encomenda_path(@lote)
    expect(page).to have_text("Realizando uma nova encomenda")
  end

  def e_preenche_o_responsavel
    @responsavel = 'Eduardo'
    fill_in('responsavel', with:@responsavel)
  end
  def e_preenche_o_endereco
    @endereco = 'Meu Endereco'
    fill_in('endereco', with:@endereco)
  end
  def e_preenche_o_celular 
    @celular = '83981081977'
    fill_in('celular', with:@celular)
  end
  def quando_preencher_nome
    @nome = 'Nome qualquer'
    fill_in('nome', with: @nome)
  end

  # Quando

  def e_clica_em_criar_encomenda 
    click_on "Criar encomenda"
  end
  def quando_clicar_em_adicionar_pedido
    click_on "Adicionar pedido"
  end 

  # ENTÃO - ENTÃO - ENTÃO - ENTÃO - ENTÃO - ENTÃO

  def entao_encomenda_foi_criada
    expect(page).to have_text("Encomenda iniciada.")
    expect(page).to have_text(@responsavel)
    expect(page).to have_text(@endereco)
    expect(page).to have_text(@celular)
    
    #expect(@lote.encomendas).not_to be_empty
    #@encomeda = @lote.encomendas.first
    #expect(@encomenda.endereco).to eq(@endereco)
  end

  def e_especificar_quantidade_do_produto (produto_quantidade)
    produto_quantidade.each do |k,v|
      id = @encomenda.lote.produtos[k].id
      fill_in('produto['+id.to_s+']', with: v.to_s)
    end
  end

  def quando_selecionar_quantidade_de_apenas_um_produto
    @produto = @lote.produtos.first
    fill_in('produto['+@produto.id.to_s+']', with: '1')
  end

  def entao_o_preco_tocal_eh_calculado_e_exibido
    pending
  end
  def e_o_preco_total_da_encomenda_eh_exibido
    expect(page).to have_text('Total')
    expect(page).to have_text(@encomenda.total.to_s(:currency))
  end

  def e_o_valor_de_cada_pedido_eh_exibido
    @encomenda.pedidos.each do |pedido|
      expect(page).to have_text(pedido.total.to_s(:currency))
    end
  end

  def e_o_valor_do_frete_eh_exibido
    expect(page).to have_text(@encomenda.frete.to_s(:currency))
  end

  def entao_o_pedido_foi_adicionado_a_encomenda
    @encomenda.reload
    expect(@encomenda.pedidos).not_to be_empty
  end

  def e_o_botao_finalizar_e_pagar_esta_visivel_e_ativo
    expect(page).to have_button('Finalizar e pagar')
  end

  def entao_apenas_o_produto_selecionado_sera_listado_nos_pedidos
    @lote.produtos.each do |produto|
      if produto != @produto then
        expect(find('#pedidos')).not_to have_text(produto.nome)
      end
    end
    
  end

end
