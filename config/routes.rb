ProjectX::Application.routes.draw do

  root to: 'dashboard#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'login' => 'sessions#index'

  resources :foods, only: [:new]
end
