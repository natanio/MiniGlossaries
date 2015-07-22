Rails.application.routes.draw do
  resources :comments

  resources :languages

  resources :translations

  resources :terms

  resources :glossaries

  devise_for :users

  root 'glossaries#index'
end
