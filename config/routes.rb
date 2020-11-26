Rails.application.routes.draw do
  devise_for :users
  get 'used_moneys/index'
  root "used_moneys#index"
  resources :used_moneys, only: [:index, :new, :create, :show]
end

