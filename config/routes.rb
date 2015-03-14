Rails.application.routes.draw do
  resources :contents do
    post 'share', on: :member
  end

  devise_for :users, controllers: { registrations: "users/registrations", confirmations: 'users/confirmations' }
  devise_scope :user do
    patch "/confirm" => "users/confirmations#confirm"
  end
  
  resources :users, except: [:index]

  root to: 'contents#index'
end
