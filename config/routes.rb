Rails.application.routes.draw do
  resources :leads
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'static_pages/dashboard'
  get 'stats', to: "static_pages#stats", as: :stats
  get 'per_day', to: "static_pages#per_day", as: :per_day_sales
  get 'per_thirty_days', to: "static_pages#per_thirty_days", as: :per_thirty_days 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#dashboard"
end
