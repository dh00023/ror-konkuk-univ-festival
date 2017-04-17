Rails.application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => 'omniauth_callbacks', :registrations => 'registrations'}
  resources :posts
  get 'search'=>'posts#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'users#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end
end
