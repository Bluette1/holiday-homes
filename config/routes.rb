Rails.application.routes.draw do
  root to: 'holiday_homes#index'
  resources :holiday_homes, only: %i[create index destroy] 
end
