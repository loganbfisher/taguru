Taguru::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users

  resources :tags, only: [:index, :create] do
    delete 'delete', action: :destroy
    collection do
      get 'search', action: :search, as: :search
    end
  end

  namespace :instagram do
    namespace :sessions do
      delete 'delete', action: :destroy
    end
  end

  namespace :api do
    resources :tags, only: [:index, :create] do
      collection do
        get 'search/:query', action: :search, as: :search
      end
    end

    namespace :instagram do
      resources :sessions, only: [:create] do
        delete :delete, action: :destroy
      end
    end

  end

end