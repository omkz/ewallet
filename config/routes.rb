Rails.application.routes.draw do
  namespace :transactions do
    resources :deposits
    resources :withdraws
    resources :transfers
  end
  
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
