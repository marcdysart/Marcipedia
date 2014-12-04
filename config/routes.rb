Rails.application.routes.draw do


  devise_for :users
  get 'upgrade' => 'welcome#upgrade'
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  resources :wikis
  resources :collaborators, only: [:create, :destroy]
  resources :charges, only: [:new, :create, :destroy]

end
