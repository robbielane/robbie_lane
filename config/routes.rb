Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'posts/dashboard', to: 'posts#dashboard'
  resources :posts, param: :slug
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:show, :index]
    end
  end
end
