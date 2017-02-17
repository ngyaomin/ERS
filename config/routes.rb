Rails.application.routes.draw do
devise_for :user
  resources :posts do
    resources :comments
  end

  
  root 'emergencies#index'
end
