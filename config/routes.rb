Rails.application.routes.draw do
  resources :libraries, only: [:index], path: 'catalogue'
  resources :purchases
  resources :users do
    get 'library', on: :member
  end
  resources :seasons
  resources :episodes
  resources :movies
end
