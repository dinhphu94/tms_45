Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "contact" => "static_pages#contact"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  resources :users
  resources :courses, only: [:index, :show]
  resources :subjects, only: [:show, :update]
  resources :user_subjects, only: [:show, :update]
  namespace :admin do
    root "static_pages#home"
    resources :courses do
      resources :user_courses, only: [:index, :show]
    end
    resources :users
    resources :subjects
  end

  resources :password_resets, except: [:destroy, :show]
end
