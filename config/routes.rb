Taguru::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users

  resources :tags, only: [:index, :create] do
    collection do
      get 'search', action: :search, as: :search
    end
  end

  namespace :api do
    resources :tags, only: [:index, :create] do
      collection do
        get 'search/:query', action: :search, as: :search
      end
    end
  end

end