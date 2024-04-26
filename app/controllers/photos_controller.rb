class PhotosController < ApplicationController
  def append_photo_form(id:)
    @inner_sash = InnerSash.find(id)
    @form_index = Time.now.to_i
  end

  def destroy_photo_form(id:)
    @photo = Photo.find(id)
  end

  def destroy_new_photo_form(index:)
    @index = index
  end
end
