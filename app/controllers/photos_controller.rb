class PhotosController < ApplicationController
  skip_forgery_protection

  def append_photo_form(id:)
    @inner_sash = InnerSash.find(id)
    @form_index = Time.now.to_i
  end

  # すでにある写真データのフォーム削除
  def destroy_existing_photo_form
    @site_memo = SiteMemo.find(site_memo_id)
    @photo = Photo.find(id)
    @form_index = Time.now.to_i
  end

  #新しく作った写真フォームの削除
  def destroy_new_photo_form(index:)
    @index = index
  end
end
