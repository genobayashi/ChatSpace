Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:show, :destroy] do
    collection do
      get  :ajax_user_list
    end
    resources :messages, only: [:index, :create]
  end
end
