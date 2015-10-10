Rails.application.routes.draw do
  devise_for :users
  get 'contacts/new'

  get 'contacts/create'

  resources :posts, :projects
  resources :contacts, only: [:new, :create]

  get 'welcome/index'
  root 'welcome#index'
end
