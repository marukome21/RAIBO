Rails.application.routes.draw do

  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

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

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :edit, :update, :show]
    resources :posts, only: [:index, :edit, :update, :destroy]
  end

end
