Rails.application.routes.draw do
   concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  get "/Courses", to: "usercourses#index"
  root to: 'pages#home'
  # get "/Courses", to: "courses#index"
  resources :usercourses, concerns: :paginatable

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/dashboard' => 'users#dashboard'
  devise_scope :user do
    get "login" => "devise/sessions#new"
  end
  devise_for :users
  
end
