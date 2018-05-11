Rails.application.routes.draw do
  root to: 'pages#home'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/dashboard' => 'users#dashboard'
  devise_scope :user do
    get "login" => "devise/sessions#new"
  end
  devise_for :users
  resources :courses
end
