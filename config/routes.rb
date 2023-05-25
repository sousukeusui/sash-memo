Rails.application.routes.draw do
  get 'site_memos/index/:site_id', to: 'site_memos#index', as: :site_memos_index
  root 'homes#top'
  get 'sign_in/index'
  get 'sign_up/index'
  get 'sign_up/step1'
  get 'sign_up/step2'
  get 'sign_up/done'
  get 'sign_up/resend_confirmation_code'
  post 'sign_up/create'
  get 'sites/index'
  get 'sites/new'
  get 'sites/search_contractor'
  post 'sites/create'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
