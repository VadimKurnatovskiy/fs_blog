Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'users/registrations' }
  get 'users/:id', to: "profiles#show", as: 'users'
  namespace :users do
    resources :posts, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create destroy)
    end
  end
  get '/search' => 'search_posts#index'
  resources :posts, only: %i(show index)

  get "/users/:user_id/posts/", to: "user_posts#index"

  root to: 'posts#index'

  %w( 403 404 422 500 ).each do |code|
    get code, :to => "errors#show", :status_code => code
  end
end
