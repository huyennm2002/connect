Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  get '/search', to: 'users#search'

  devise_for :users, controllers: {
    session: 'users/sessions'
  }
  # get 'search', 'user#search'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"

  resources :users 

  resources :posts do 
    resources :comments, only: [:new, :edit]
  end 

  resources :comments, only: [:create, :update, :destroy]
  
  resources :likes, only: [:create, :destroy]

  resources :friend_reqs, only: [:create, :show] do
    member do
      post 'accept'
      delete 'reject'
    end
  end
      
end
