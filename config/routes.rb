ProjectX::Application.routes.draw do

  root to: 'dashboard#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'login' => 'sessions#index'

  root to: 'dashboard#index'

  resources :users, only: [:show]

  get 'food/lookup', to: 'foods#lookup', as: 'food_lookup'
  post 'food/search', to: 'foods#search', as: 'food_search'

end
