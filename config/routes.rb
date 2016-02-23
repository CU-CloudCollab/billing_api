Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :account do
        member do
          get 'aggregate'
        end
      end
      resources :user
      resources :current_month
      resources :up_test
    end
  end
end
