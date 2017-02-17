Rails.application.routes.draw do
  resources :posts
  get 'emergencies/index'
  root 'emergencies#index'
end
