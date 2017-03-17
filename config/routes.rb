Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  resources :groups, except: [:index, :show, :destroy] do
    resources :message, only: [:index]
  end
end
