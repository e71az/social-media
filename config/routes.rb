Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # resources :friendships
  # resources :friendships, only: %i[create show index update destroy new]
  post '/friendships/new', to: 'friendships#new'
  delete '/friendships/:id', to: 'friendships#destroy', as: :friendships_destroy
  get '/friendships', to: 'friendships#index'
  post '/friendships/accept/:id', to: 'friendships#accept', as: :friendships_accept
  delete '/friendships/reject/:id', to: 'friendships#reject', as: :friendships_reject

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
