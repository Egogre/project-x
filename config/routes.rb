ProjectX::Application.routes.draw do
  root to: "dashboard#index"
  get 'home' => 'dashboard#index'

end
