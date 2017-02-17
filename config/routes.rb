Rails.application.routes.draw do
devise_for :user  
  resources :posts do
    resources :comments
  end

  get 'emergencies/index'
  root 'emergencies#index'
end
