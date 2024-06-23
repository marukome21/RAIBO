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
  get 'users/my_page/:id', to: 'public/users#show', as: :users_my_page


  get 'search/', to: 'searches#search', as: :search #検索ページ





  scope module: 'public' do
    resources :users, only:[] do
      get 'followings' => 'followings#followings', as: 'followindex'
      get 'followers' => 'followings#followers', as: 'followers'
      resource :followings, only: [:create, :destroy]
    end
    resources :posts, only: [:show, :index, :create, :destroy, :new] do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :edit, :update, :show, :destroy]
  end

end
