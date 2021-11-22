Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :requests, only: [:index, :show, :new, :create]
  root 'home#index'
end
