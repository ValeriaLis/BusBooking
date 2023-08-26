Rails.application.routes.draw do
  resources :bookings
  devise_for :users
  resources :tickets, only: [:show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :tickets do
    resources :bookings
  end
  root 'tickets#index'
end
