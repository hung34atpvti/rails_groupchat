Rails.application.routes.draw do
  devise_for :users

  root 'chat_rooms#index'

  resources :chat_rooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
