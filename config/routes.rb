<<<<<<< HEAD
Rails.application.routes.draw do
  resources :tweets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello-world' => "foo#hello"
=======
Rails.application.routes.draw do
  resources :tweets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello-world' => "foo#hello"
>>>>>>> 1e326ce2cd9d17b4e23b158fc29347e93ad056a0
end