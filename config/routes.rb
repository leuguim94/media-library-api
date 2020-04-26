Rails.application.routes.draw do
  resources :libraries
  resources :purchases
  resources :users do
    get 'library', on: :member
  end
  resources :seasons
  resources :episodes
  resources :movies
end
