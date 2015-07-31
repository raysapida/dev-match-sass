Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :contacts, only: [:new, :create]
  get '/about' => 'pages#about'
end
