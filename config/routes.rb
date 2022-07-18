Rails.application.routes.draw do
  get 'buying_items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "items#index"
  resources :items do
    resources :buying_items, only: [:index, :create]
   end
end

