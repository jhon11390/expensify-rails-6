Rails.application.routes.draw do
  root 'dashboards#index'
  resources :expenses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses, only: [:index, :create, :update, :destroy]
    end
  end
end
