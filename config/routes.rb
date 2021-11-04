Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get 'home' => "static_pages#home"
  get 'help' => "static_pages#help"
  get 'about' => "static_pages#about"
  get 'contact' => "static_pages#contact"
  get 'signup' => "users#new"
  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :tweets, only: [:create, :edit, :update, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello-world' => "foo#hello"
end