Rails.application.routes.draw do
  resources :books, only: %i[index show] do
    resources :comments, only: %i[index create]
  end
  resources :authors, only: %i[index]
end
