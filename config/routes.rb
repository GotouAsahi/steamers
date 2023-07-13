Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: "about"
  resources :games
  resources :users, only: [:index,:show,:edit,:update]
end
