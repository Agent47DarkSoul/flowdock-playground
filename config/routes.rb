Rails.application.routes.draw do
  root :to => 'users#profile'

  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new', as: :login
  end

  get '/profile' => 'users#profile'

  resources :users

  get "/auth/:provider/callback" => "users#oauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
