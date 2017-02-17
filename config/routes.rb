Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  get 'emergencies/index'
  root 'emergencies#index'
end
