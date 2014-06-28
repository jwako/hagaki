Rails.application.routes.draw do

  resource :top, controller: :top, only: :show
  root :to => 'top#show'

  devise_for :admins
  namespace :x do
    resource :home, controller: :home, only: :show
    resources :users, only: [:index, :show]
  end

end
