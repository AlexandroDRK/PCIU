Rails.application.routes.draw do
  get 'comunicado/index'
  get 'curso/index'
  get 'curso/show'
<<<<<<< HEAD
  
  devise_for :usuario, controllers: {
    sessions: 'usuario/sessions',
    registrations: "usuario/registrations"
  }
  resource :cursos
  root "pciu#home"
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "comunicado#index"
>>>>>>> f9ab40b (Comunicados branch)
end
