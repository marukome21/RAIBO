Rails.application.routes.draw do
  namespace :admin do
    get 'homes/posts'
    get 'homes/users'
    get 'homes/comments'
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
end
