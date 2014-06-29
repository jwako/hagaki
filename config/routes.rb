Rails.application.routes.draw do

  get 'tutorial/show'

  devise_for :users
  root :to => 'top#show'
  resource :top, controller: :top, only: :show
  resource :home, controller: :home, only: :show
  resources :messages, only: [:index, :show, :new, :create]
  resources :receives, only: :index
  resource :guides, only: :show do
    get :start, on: :collection
  end
  resource :tutorial, controller: :tutorial, only: :show
  
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
