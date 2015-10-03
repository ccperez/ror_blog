Rails.application.routes.draw do
  resources :posts, :projects

  get 'welcome/index'
  root 'welcome#index'
end
