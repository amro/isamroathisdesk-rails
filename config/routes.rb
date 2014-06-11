Rails.application.routes.draw do
  resources :statuses, controller: 'statuses', only: [:index, :create]
  root to: 'statuses#index'
end
