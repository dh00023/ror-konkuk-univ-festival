Rails.application.routes.draw do
  resources :posts
  get 'search'=>'posts#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
