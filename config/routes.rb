Rails.application.routes.draw do

  #nameでログインする為の記述
  devise_for :users#controllers以降いらない

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  root 'home#top'
  get 'home/about'

  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end


end
