Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :books, only: [:index, :show, :new, :create] do
    member do
      post 'borrow'
      patch 'return' # Changed from POST to PATCH for returning a book
    end
  end

  get 'profile', to: 'users#show', as: 'profile'

  root "books#index"
end
