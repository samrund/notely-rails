Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: :create
  get 'sign_up' => 'users#new'

  resources :notes, except: :edit

  resources :sessions, only: :create
  delete 'logout' => 'sessions#destroy'
  get 'login'     => 'sessions#new'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :notes
    end
  end
end
