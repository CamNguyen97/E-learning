Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
   concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  root to: 'pages#home'
  resources :usercourses, concerns: :paginatable
  resources :profiles
  resources :pages

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/dashboard' => 'users#dashboard'
  devise_scope :user do
    get "login" => "devise/sessions#new"
  end
  devise_for :users
  # mount Ckeditor::Engine =>"/ckeditor"
end
