Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  devise_for :users, controllers: {
    session: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :users
  resources :posts
end
