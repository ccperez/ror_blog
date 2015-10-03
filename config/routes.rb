Rails.application.routes.draw do
  get 'contacts/new'

  get 'contacts/create'

  resources :posts, :projects
  resources :contacts, only: [:new, :create]

  get 'welcome/index'
  root 'welcome#index'
end
