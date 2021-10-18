Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :transactions, only: [:create, :update, :destroy]
      resources :budgets
      resources :users, only: [:create, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
