Rails.application.routes.draw do
  devise_scope :user do
    root "users/sessions#new"
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions'
  }
  resources :events

  namespace :admin do
    resources :events
    resources :users
  end
end
