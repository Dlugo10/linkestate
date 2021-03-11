Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :properties
#     resources :favorites, only: [:index, :show, :create, :destroy]
#     resources :tax_histories, only: [:show, :update, :create]
#   end
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
