Rails.application.routes.draw do
  get 'used_monies/index'
  root "used_monies#index"
end

