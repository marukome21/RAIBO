Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  root to: 'public/homes#top'

  scope module: 'public' do
    resources :posts, only: [:show, :index, :create, :destroy, :new]
  end

end
