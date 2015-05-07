Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: :create do

  end
  get 'sign_up' => 'users#new'

  resources :notes

  resources :sessions, only: :create
  delete 'logout' => 'sessions#destroy'
  get 'login'     => 'sessions#new'
end
