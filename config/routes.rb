Rails.application.routes.draw do
  resources :contents

  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, except: [:index]

  root to: 'contents#index'
end
