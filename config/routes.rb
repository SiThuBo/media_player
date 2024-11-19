Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :posts, only: [:new, :create, :show]
  root 'posts#new'
end
