Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    devise_scope :user do
      post "sign_up", to: "registrations#create"
      post "sign_in", to: "sessions#create"
    end
  end

  root to: 'holiday_homes#index'
  resources :favourites, only: [:destroy, :index, :update], controller: 'favourites'
  resources :holiday_homes, only: %i[create index destroy update] do
    resources :favourites, only: [:create], controller: 'favourites'
  end
  resources :categories, only: %i[index]
end
