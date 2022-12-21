Rails.application.routes.draw do
  get 'curso/index'
  get 'curso/show'
  
  devise_for :usuario, controllers: {
    sessions: 'usuario/sessions',
    registrations: "usuario/registrations"
  }
  resource :cursos
  root "pciu#home"
end
