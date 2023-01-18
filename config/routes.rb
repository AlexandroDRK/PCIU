Rails.application.routes.draw do
  
  root "comunicado#index"

  resources :comunicado do
    resources :comentario
  end
  
  #get '/comunicado/:comunicado_id/comentario/:comentario_id', to: 'comentario#new'
  #post '/comunicado/:comunicado_id/comentario/:comentario_id', to: 'comentario#new'
  #post 'comentario', to: 'comentario#create'
  #get 'criar-comentario', to: 'comentario#new'
  
  #get 'comunicado/:id', to: 'comunicado#show', as: 'comunicado'
  get 'comunicado/new'
  post 'comunicado', to: 'comunicado#create'
  get 'criar-comunicado', to: 'comunicado#new'
  delete 'excluir_comunicado', to: 'comunicado#destroy'
  
  devise_for :usuario

end
