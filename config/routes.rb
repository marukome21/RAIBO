Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  root to: 'public/homes#top'

  get 'users/information/edit', to: 'public/users#edit', as: 'edit_users_information'
  patch 'users/information', to: 'public/users#update', as: 'update_users_information'
  get 'users/unsubscribe', to: 'public/users#unsubscribe', as: :users_unsubscribe
  patch 'users/withdraw', to: 'public/users#withdraw', as: :users_withdraw
  get 'users/my_page', to: 'public/users#show', as: :users_my_page



  scope module: 'public' do
    resources :posts, only: [:show, :index, :create, :destroy, :new]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
end
