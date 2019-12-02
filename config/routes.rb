Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'messages#index'
  resources :public_keys
  resources :messages
  resources :users, except: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
