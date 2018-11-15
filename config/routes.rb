Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails do
    # resources :dozes, only: [:new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'cocktails', to: 'cocktails#index', as: :cocktails
  # get 'cocktail/:id', to: 'cocktails#show', as: :cocktail

  # get 'cocktails/new', to: 'cocktails#new', as: :new_cocktail
  # post 'cocktails', to: 'cocktalis#create'

  # get 'cocktails/:cocktail_id'

  resources :cocktails, except: [:edit, :update, :delete] do
    resources :doses, only: [:new, :create, :delete]
  end

  root to: 'cocktails#index'
end
