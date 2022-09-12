Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :books, only: [:index, :new, :create, :destroy, :edit, :update]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
