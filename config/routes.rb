Rails.application.routes.draw do
  root 'reservations#index'
  devise_for :user
  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :books, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :reservations, only: [:index, :new, :create, :edit, :update], to: 'reservations#index' do
    get 'finish', on: :member
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
