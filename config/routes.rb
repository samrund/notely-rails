Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: :create
  get 'sign_up' => 'users#new'
end
