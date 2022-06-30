Rails.application.routes.draw do
  get 'posts/index'
  post 'posts/index'
  get 'users/index'
  get '/search', to: 'users#search'
  
  
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/auth/:provider/callback' => 'users/sessions#create'
    # get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "posts#index"

  resources :users do
    post 'remove_avatar'
  end

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
