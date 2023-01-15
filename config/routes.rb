Rails.application.routes.draw do
  root "comunicado#index"
  
  # get 'comunicado/index'
  get 'comunicado/new'
  #get 'comunicado'
  post 'comunicado', to: 'comunicado#create'
  get 'criar-comunicado', to: 'comunicado#new'
  delete 'excluir_comunicado', to: 'comunicado#destroy'
  
  devise_for :usuario
  
  # root "pciu#home"
end
