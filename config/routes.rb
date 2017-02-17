Rails.application.routes.draw do
  get 'emergencies/index'
  root 'emergencies#index'
end
