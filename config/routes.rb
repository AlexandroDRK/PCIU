Rails.application.routes.draw do
  root "comunicado#index"
  
  # get 'comunicado/index'
  get 'comunicado/new'
  post 'comunicado', to: 'comunicado#create'
  get 'criar-comunicado', to: 'comunicado#new'
  
  #get 'curso/index'
  #get 'curso/show'
  
  devise_for :usuario
  
  # root "pciu#home"
end
