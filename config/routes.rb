Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get 'sign_up/index'
  get 'sign_up/step1'
  get 'sign_up/step2'
  get 'sign_up/done'
  post 'sign_up/create'
  get 'sites/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
