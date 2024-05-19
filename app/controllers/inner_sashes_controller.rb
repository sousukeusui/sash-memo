class InnerSashesController < ApplicationController
  permits :remark, inner_sashes_attributes: [:id, :room, :number_of_shoji, :width_up_size, :width_down_size, :width_middle_size, 
    :height_left_size, :height_middle_size, :height_right_size, :width_frame_depth, :height_frame_depth,
    :color, :is_flat_bar, :hanging_origin, :key_height, :sash_type, :middle_frame_height, :is_adjust,
    :glass_color, :glass_thickness, :glass_kind, :is_low_e, photos_attributes: [:id, :file_name, :_destroy]],
    model_name: 'SiteMemo'

  def new_step2
    load_inner_sashes
    @inner_sash = InnerSash.new
  end

  def new_append_room
    @inner_sash = InnerSash.new(inner_sash_params)
    @inner_sash = InnerSash.new if @inner_sash.save
    load_inner_sashes
  end

  def new_step3
    load_site_memo
    load_inner_sashes
  end

  def new_append_basic_info(site_memo)
    load_site_memo
    return redirect_to inner_sashes_new_step4_path if @site_memo.update(site_memo)
    load_inner_sashes
    return render "new_step3", status: :unprocessable_entity
  end

  def new_step4
    load_site_memo
    load_inner_sashes
  end

  def new_append_shoji_and_glass(site_memo)
    load_site_memo
    return redirect_to inner_sashes_new_step5_path if @site_memo.update(site_memo)
    load_inner_sashes
    return render "new_step4", status: :unprocessable_entity
  end

  def new_step5
    load_site_memo
    load_inner_sashes
  end

  def new_append_photo_and_others(site_memo)
    load_site_memo
    return redirect_to inner_sashes_new_comfirmation_path if @site_memo.update(site_memo)
    load_inner_sashes
    return render 'new_step5', status: :unprocessable_entity
  end

  def new_comfirmation
    @site_memo = SiteMemo.preload(inner_sashes: :photos).find_by(site_id: session[:site_id], kind: 'inner_sash')
  end
  
  def show(id:)
    @inner_sash = InnerSash.preload(site_memo: :site).find(id)
    @order_key = get_opposite_order_key(inner_sash: @inner_sash)
    @basic_active = 'is-active'
  end

  def update_order(id:, order:)
    @inner_sash = InnerSash.find(id)
    @inner_sash.site_memo.update!(order: order)
    @order_key = get_opposite_order_key(inner_sash: @inner_sash)
    flash.now.notice = "#{SiteMemo.orders_i18n[order.to_sym]}にしました"
  end

  def destroy(id:)
    inner_sash = InnerSash.find(id)
    @site_id = inner_sash.site_memo.site.id
    inner_sash.destroy
    redirect_to site_memos_index_path(site_id: @site_id), notice: "メモを削除しました"
  end

  def navigate_page(id:)
    @inner_sash = InnerSash.preload(site_memo: :site).find(id.to_i)
    @order_key = get_opposite_order_key(inner_sash: @inner_sash)
    @basic_active = 'is-active'
  end

  def basic_info(id:)
    @inner_sash = InnerSash.find(id)
    @basic_active = 'is-active'
  end

  def shoji_and_glass(id:)
    @inner_sash = InnerSash.find(id)
    @shoji_active = 'is-active'
  end

  def photo_and_others(id:)
    @inner_sash = InnerSash.find(id)
    @photo_active = 'is-active'
  end

  def edit_basic_info(id:)
    @inner_sash = InnerSash.find(id)
  end

  def edit_shoji_and_glass(id:)
    @inner_sash = InnerSash.find(id)
  end

  def edit_photo_and_others(id:)
    @inner_sash = InnerSash.find(id)
    # @photo = @inner_sash.inner_sash_photos.build
  end

  def update(id:)
    inner_sash = InnerSash.find(id)
    inner_sash.update!(inner_sash_params)

    # previous_actionはbasic_info、shoji_and_glass、photo_and_othersのどれか
    previous_action = inner_sash_params[:action].sub('edit_','')
    notice = I18n.t("inner_sashes.update.#{previous_action}")

    redirect_to "/inner_sashes/#{previous_action}/#{id}", notice: "#{notice}を更新しました"
  end

private

  def inner_sash_params
    params.require(:inner_sash).permit(:room, :number_of_shoji, :width_up_size, :width_down_size, :width_middle_size, 
                                      :height_left_size, :height_middle_size, :height_right_size, 
                                      :width_frame_depth, :height_frame_depth, :is_flat_bar, :is_adjust, :action, photos_attributes: [:id, :file_name, :_destroy]).merge(site_memo_id: load_site_memo.id)
  end

  def load_inner_sash
    @inner_sash = InnerSash.find()
  end

  def load_inner_sashes
    @inner_sashes = InnerSash.eager_load(:site_memo).where(site_memo: {kind: 'inner_sash', site_id: session[:site_id]})
  end

  def load_site_memo
    @site_memo = SiteMemo.find_by(kind: 'inner_sash', site_id: session[:site_id])
  end

  def load_inner_sashes_photos
    @inner_sashes = inn.eager_load(inner_sash: :site_memo).where(site_memo: {kind: 'inner_sash', site_id: session[:site_id]})
  end
end