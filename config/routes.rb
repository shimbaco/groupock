Claspock::Application.routes.draw do
  resources :users, only: [] do
    get :signin, on: :collection
    get :signout, on: :collection
  end

  resources :items, only: [:index]

  get '/auth/:provider/callback' => 'users#signin'

  root to: 'pages#index'
end
