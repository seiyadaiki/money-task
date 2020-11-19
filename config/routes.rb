Rails.application.routes.draw do
  devise_for :users
  get 'used_monies/index'
  root "used_monies#index"
end

