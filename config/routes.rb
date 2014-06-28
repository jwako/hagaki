Rails.application.routes.draw do

  root :to => 'top#show'
  resource :top, controller: :top, only: :show
  resources :messages, only: [:index, :show, :new, :create]

  devise_for :admins
  namespace :x do
    resource :home, controller: :home, only: :show
    resources :users, only: [:index, :show]
    resources :notifications, only: [:index, :show, :new, :create, :edit, :update]
    resources :messages, only: [:index, :edit, :update] do
      post :connect, on: :member
    end
  end

end
