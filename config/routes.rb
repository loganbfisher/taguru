Taguru::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  namespace :api do
    resources :tags, only: [:index, :create]
  end

  #resource :tags, only: [:index, :search, :create] do
  #  root to: 'tags#index'
  #
  #  get :search
  #end

end