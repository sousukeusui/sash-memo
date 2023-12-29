Rails.application.routes.draw do
  get 'site_memos/index/:site_id', to: 'site_memos#index', as: :site_memos_index
  get 'site_memos/show_switcher/:kind/:id', to: 'site_memos#show_switcher', as: :site_memos_show_switcher
  get 'site_memos/new_step1/:site_id', to: 'site_memos#new_step1', as: :site_memos_new_step1
  get 'inner_sashes/new_step2/:site_id', to: 'inner_sashes#new_step2', as: :inner_sashes_new_step2
  get 'inner_sashes/new_step3/:site_id', to: 'inner_sashes#new_step3', as: :inner_sashes_new_step3
  get 'inner_sashes/new_step4/:site_memo_id', to: 'inner_sashes#new_step4', as: :inner_sashes_new_step4
  get 'inner_sashes/new_step5/:site_memo_id', to: 'inner_sashes#new_step5', as: :inner_sashes_new_step5
  get 'inner_sashes/new_step6/:site_memo_id', to: 'inner_sashes#new_step6', as: :inner_sashes_new_step6
  get 'inner_sashes/new_comfirmation/:site_memo_id', to: 'inner_sashes#new_comfirmation', as: :inner_sashes_new_comfirmation
  get 'inner_sashes/show/:id', to: 'inner_sashes#show', as: :inner_sashes_show
  post 'inner_sashes/room_append'
  patch 'inner_sashes/basic_append'
  patch 'inner_sashes/accessory_append'
  patch 'inner_sashes/glass_append'
  patch 'inner_sashes/photo_append'
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
  delete 'sites/destroy/:id', to: 'sites#destroy', as: :sites_destroy
  get 'sites/search_contractor'
  post 'sites/create'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
