Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :lotes, only: [:show, :index] do
    resources :encomendas, only: [:new, :create]
    
  end

  get '/encomendas/:id/:uuid', to: 'encomendas#show', as: 'encomenda'
  post '/encomendas/:id/:uuid', to: 'encomendas#create_pedido', as: 'cria_pedido'

end
