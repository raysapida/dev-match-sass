Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'pages#home'
  resources :users do
    resource :profile
  end
  resources :contacts, only: [:new, :create]
  get '/about' => 'pages#about'
end
