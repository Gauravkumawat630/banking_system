Rails.application.routes.draw do
  resources :accounts, only: [:index, :show] do
    resources :transactions, only: [:create]
  end
end
