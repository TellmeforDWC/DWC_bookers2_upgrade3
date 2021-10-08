Rails.application.routes.draw do
  get 'relationships/show_follow'
  get 'relationships/show_follower'
  devise_for :users

  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followees" => "relationships#show_followees", as: "show_followees"
    get "followers" => "relationships#show_followers", as: "show_followers"
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get "search" => "searches#search", as: "search"

  root 'homes#top'
  get 'home/about' => 'homes#about', as: "about"

end