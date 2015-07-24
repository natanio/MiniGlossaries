Rails.application.routes.draw do
  resources :comments

  resources :languages

  resources :terms do
    resources :translations
  end

  resources :glossaries

  devise_for :users

  root 'glossaries#index'
end
