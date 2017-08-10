Rails.application.routes.draw do
  get 'doses/index'

  get 'doses/show'

  get 'doses/new'

  get 'doses/create'

  get 'doses/destroy'

  resources :cocktail, only: [ :index, :new, :create, :show] do
    resources :doses, only: [:new, :create]
  end
  root 'cocktail#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
