Rails.application.routes.draw do



  devise_for :users
  root to: "home#top"
  resources :books, only: [:new, :create, :index, :edit, :show, :update, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
  get "/home/about" => "home#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
