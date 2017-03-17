Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  resources :groups, except: [:index, :show, :destroy] do
    resources :messages, only: [:index]
  end
end
