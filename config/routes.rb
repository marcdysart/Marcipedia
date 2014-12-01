Rails.application.routes.draw do


  devise_for :users
  get 'upgrade' => 'welcome#upgrade'
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  resources :wikis do
    resources :collaborators
  end
  resources :charges, only: [:new, :create, :destroy]
  resources :users, only: [:update, :show, :index]

end
