Rails.application.routes.draw do
  get 'cocktails/index'

  get 'cocktails/show'

  get 'cocktails/new'

  get 'cocktails/create'

  resources :cocktail, only: [ :index, :new, :create, :show] do
    resources :doses, only: [:new, :create]
  end
  root 'cocktail#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
