Rails.application.routes.draw do
   devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
   concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  root to: 'pages#home'
  resources :usercourses, concerns: :paginatable
  resources :profiles
  resources :pages

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/dashboard' => 'users#dashboard'
  devise_scope :users do
    get "login" => "devise/sessions#new"
  end
  
end
