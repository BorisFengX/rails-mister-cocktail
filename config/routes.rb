Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'cocktails', to: 'cocktails#index', as: :cocktails
  # get 'cocktail/:id', to: 'cocktails#show', as: :cocktail

  # get 'cocktails/new', to: 'cocktails#new', as: :new_cocktail
  # post 'cocktails', to: 'cocktalis#create'

  # get 'cocktails/:cocktail_id'
  # , except: [:edit, :update, :delete]

  resources :cocktails do

    collection do
      get 'filter', to: 'cocktails#filter'
    end
    resources :doses, only: [:new, :create, :destroy]
  end


  root to: 'cocktails#index'
end
