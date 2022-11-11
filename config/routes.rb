Rails.application.routes.draw do
  # devise_for :users
  # rootをログイン画面に設定する
  devise_scope :user do
    root "users/sessions#new"
  end

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
  get 'mypage', to: 'users#me'
  get 'mypage/reservation', to: 'users#my_reservation'

  resources :events do
    resources :reservations
  end
end
