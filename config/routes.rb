Rails.application.routes.draw do
  resources :emergencies
  get 'emergencies/index'
  root 'emergencies#index'
end
