Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "sign_in", to: "sessions#create"
    end
  end

  root to: 'holiday_homes#index'
  resources :holiday_homes, only: %i[create index destroy]
  resources :categories, only: %i[index]
end
