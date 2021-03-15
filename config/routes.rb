Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :properties do
    resources :favorites, only: [:show, :create, :destroy]
     resources :tax_histories, only: [:index, :new, :create, :edit, :update ]
#     resources :tax_histories, only: [:show, :update, :create]
  end
  resources :favorites, only: [:index]
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
