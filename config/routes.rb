Rails.application.routes.draw do
  get 'site_memos/index/:site_id', to: 'site_memos#index', as: :site_memos_index
  post 'site_memos/update_bulk_order/:site_id/:order', to: 'site_memos#update_bulk_order', as: :site_memos_update_bulk_order
  get 'site_memos/show_switcher/:kind/:child_id', to: 'site_memos#show_switcher', as: :site_memos_show_switcher
  get 'site_memos/new_step1/:site_id', to: 'site_memos#new_step1', as: :site_memos_new_step1
  post 'site_memos/form_switcher'
  delete 'site_memos/destroy/:kind/:child_id', to: 'site_memos#destroy', as: :site_memos_destroy
  get 'inner_sashes/new_step2'
  post 'inner_sashes/new_append_room'
  get 'inner_sashes/new_step3'
  patch 'inner_sashes/new_append_basic_info'
  get 'inner_sashes/new_step4'
  patch 'inner_sashes/new_append_shoji_and_glass'
  get 'inner_sashes/new_step5'
  patch 'inner_sashes/new_append_photo_and_others'
  get 'inner_sashes/new_comfirmation'
  get 'inner_sashes/show/:id', to: 'inner_sashes#show', as: :inner_sashes_show
  delete 'inner_sashes/destroy/:id', to: 'inner_sashes#destroy', as: :inner_sashes_destroy
  post 'inner_sashes/navigate_page/:id', to:'inner_sashes#navigate_page', as: :inner_sashes_navigate_page
  post 'inner_sashes/update_order/:id/:order', to: 'inner_sashes#update_order', as: :inner_sashes_update_order
  get 'inner_sashes/switch/:template/:id', to: 'inner_sashes#switch', as: :inner_sashes_switch
  patch 'inner_sashes/update/:id', to: 'inner_sashes#update', as: :inner_sashes_update
  patch 'inner_sashes/glass_append'
  delete 'photos/destroy_existing_photo_form/:id', to: 'photos#destroy_existing_photo_form', as: :photos_destroy_existing_photo_form
  delete 'photos/destroy_new_photo_form/:index', to: 'photos#destroy_new_photo_form', as: :photos_destroy_new_photo_form
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
