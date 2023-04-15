Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :sign_up do
    collection do
      get 'step1'
      get 'step2'
      get 'done'
    end
  end
  get 'sites/index', to: 'sites#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
