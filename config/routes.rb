Rails.application.routes.draw do
  resources :leads
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'static_pages/dashboard'
  get 'stats', to: "static_pages#stats"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#dashboard"
end
