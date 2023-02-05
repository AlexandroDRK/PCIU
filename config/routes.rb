Rails.application.routes.draw do
  root "comunicado#index"

  get 'comunicado/new'
  post 'novo-comunicado', to: 'comunicado#create'
  get 'criar-comunicado', to: 'comunicado#new'
  get 'comunicado/:id', to: 'comunicado#show', as: 'comunicado'
  delete 'excluir_comunicado', to: 'comunicado#destroy'

  #nested routes for comentarios:
  resources :comunicado do
    resources :comentario
  end

  #post route needed to comentario create form:
  post 'comentario', to: 'comentario#create'
  delete 'excluir-comentario', to: 'comentario#destroy'

  devise_for :usuario
end
