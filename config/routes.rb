Rails.application.routes.draw do
  root "comunicado#index"

  get 'comunicado/new'
  post 'novo-comunicado', to: 'comunicado#create'
  get 'criar-comunicado', to: 'comunicado#new'
  delete 'excluir_comunicado', to: 'comunicado#destroy'
  get 'comunicado/:id', to: 'comunicado#show', as: 'comunicado'

  post 'novo-comentario', to: 'comentario#create'
  delete 'excluir-comentario', to: 'comentario#destroy'

  devise_for :usuario

end
