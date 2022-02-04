Rails.application.routes.draw do
  root 'jobs#index'

  # Restrict the available routes to those supported.
  resources :jobs, only: [:index, :show, :create]
end
