Rails.application.routes.draw do
  get 'site_memos/index/:site_id', to: 'site_memos#index', as: :site_memos_index
  get 'site_memos/new_step1/:site_id', to: 'site_memos#new_step1', as: :site_memos_new_step1
  get 'inner_sashs/new_step2/:site_id', to: 'inner_sashs#new_step2', as: :inner_sashs_new_step2
  get 'inner_sashs/new_step3'
  post 'inner_sashs/room_append'
  get 'inner_sashs/session_delete'
  get 'site_memos/form_switcher'
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
