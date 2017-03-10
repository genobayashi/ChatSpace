Rails.application.routes.draw do
  devise_for :users
  resources :chats, only: [:index]
end
