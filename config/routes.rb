Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  resources :chats, only: [:index]
  resources :groups, except: [:index, :show, :destroy]
end
