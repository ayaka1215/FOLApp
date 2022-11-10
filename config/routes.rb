Rails.application.routes.draw do
  # devise_for :users
  # rootをログイン画面に設定する
  devise_scope :user do
    root "users/sessions#new"
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions'
  }

  resources :events
end
