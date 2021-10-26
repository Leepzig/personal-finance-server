Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :transactions, only: [:create, :update, :destroy]
      resources :budgets
      resources :users, only: [:create, :show]

      #custom routes
      post "/login", to: "auth#create"
      get "/get-current-user", to: "auth#get_current_user"
      post "/signup", to: "users#create"
      post "/budgets/:budget_id/transactions", to: "transactions#create"
      post "/users/:user_id/budgets", to: "budgets#create"
      get "/users/:user_id/budgets", to: "budgets#index"
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
