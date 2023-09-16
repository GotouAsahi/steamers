Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about', as: 'about'
  resources :games do
    resources :game_comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    post "search" => "users#search"
  end
  resources :chats, only: %i[show create]
end
