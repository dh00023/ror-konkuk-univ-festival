Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => 'omniauth_callbacks', :registrations => 'registrations'}

  resources :posts do
    collection do
     get 'search'
    end
  end

  get 'lighting'=>'users#index'
  root 'posts#index'

  resources :conversations do
    resources :messages
  end
end
