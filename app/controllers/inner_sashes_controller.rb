class InnerSashesController < ApplicationController
  permits :id, :number_of_shoji, :width_up_size, :width_down_size, :width_middle_size, 
          :height_left_size, :height_middle_size, :height_right_size, :width_frame_depth, :height_frame_depth,
          :color, :is_flat_bar, :hanging_origin, :key_height, :sash_type, :middle_frame_height, :is_adjust,
          :glass_color, :glass_thickness, :glass_kind, :is_low_e, :action, site_memo_attributes: [:id, :remark],
          photos_attributes: [:id, :file_name, :_destroy]

  def new_step2(site_id:)
    #下書きがあれば下書きからデータを取ってくる処理を追加
    @site_id = site_id
  end

  def new_step3(site_id:)
    @site_memo = SiteMemo.find_by(site_id: site_id)
  end

  def new_step4(site_memo_id:)
    @site_memo = SiteMemo.find(site_memo_id)
  end

  def new_step5(site_memo_id:)
    @site_memo = SiteMemo.find(site_memo_id)
  end

  def new_step6(site_memo_id:)
    @site_memo = SiteMemo.find(site_memo_id)
  end

  def new_comfirmation(site_memo_id:)
    @site_memo = SiteMemo.find(site_memo_id)
  end

  def room_append(room:, width_up_size:, width_middle_size:, width_down_size:,
                  height_left_size:, height_right_size:, height_middle_size:,
                  height_frame_depth:, width_frame_depth:, site_id:)
    site_memo = SiteMemo.new(kind: :inner_sash, site_id: site_id)
    site_memo = SiteMemo.find_by(site_id: site_id) if SiteMemo.exists?(site_id: site_id)
    inner_sash = site_memo.inner_sashes.build(room: room, width_up_size: width_up_size, width_middle_size: width_middle_size, width_down_size: width_down_size,
                                              height_left_size: height_left_size, height_middle_size: height_middle_size, height_right_size: height_right_size,
                                              height_frame_depth: height_frame_depth, width_frame_depth: width_frame_depth)
    return redirect_to inner_sashes_new_step2_path, notice: inner_sash.errors.full_messages unless inner_sash.save!
    @inner_sash = inner_sash.attributes
  end

  def basic_append
    #内窓データ更新の処理を書く
    site_memo = SiteMemo.find(params[:site_memo][:id])
    return redirect_to inner_sashes_new_step4_path(params[:site_memo][:id]) if site_memo.update(basic_info_params)
    return redirect_to inner_sashes_new_step3_path(params[:site_memo][:id]), notice: site_memo.errors.full_messages
  end

  def accessory_append
    site_memo = SiteMemo.find(params[:site_memo][:id])
    return redirect_to inner_sashes_new_step5_path(params[:site_memo][:id]) if site_memo.update(accesory_info_params)
    return redirect_to inner_sashes_new_step4_path(params[:site_memo][:id]), notice: site_memo.erros.full_messages
  end

  def glass_append
    site_memo  = SiteMemo.find(params[:site_memo][:id])
    return redirect_to inner_sashes_new_step6_path(params[:site_memo][:id]) if site_memo.update!(glass_info_params)
    return redirect_to inner_sashes_new_step5_path(params[:site_memo][:id]), notice: site_memo.errors.full_messages
  end

  #引数はsite_memo.idで良い気がする
  def photo_append
    site_memo = SiteMemo.find(params[:site_memo][:id])
    return redirect_to inner_sashes_new_comfirmation_path(params[:site_memo][:id]) if site_memo.update!(photo_info_params)
    return redirect_to inner_sashes_new_step6_path(params[:site_memo][:id]), notice: site_memo.errors.full_messages
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

  def update(inner_sash)
    @inner_sash = InnerSash.find(inner_sash[:id])
    @inner_sash.update!(inner_sash)
    redirect_to inner_sashes_basic_info_path(@inner_sash.id), notice: '基本情報を更新しました' if inner_sash[:action] == 'edit_basic_info'
    redirect_to inner_sashes_shoji_and_glass_path(@inner_sash.id), notice: '障子・ガラスを更新しました' if inner_sash[:action] == 'edit_shoji_and_glass'
    redirect_to inner_sashes_photo_and_others_path(@inner_sash.id), notice: '写真・その他を更新しました' if inner_sash[:action] == 'edit_photo_and_others'
  end

  private
  def basic_info_params
    params.require(:site_memo).permit(:id,
                                      inner_sashes_attributes: [:sash_type, :color, :number_of_shoji, :hanging_origin, :id])
  end

  def accesory_info_params
    params.require(:site_memo).permit(:id,
                                      inner_sashes_attributes: [:key_height, :middle_frame_height, :is_flat_bar, :is_adjust, :id])
  end

  def glass_info_params
    params.require(:site_memo).permit(:id,
                                      inner_sashes_attributes: [:glass_thickness, :glass_kind, :glass_color, :is_low_e, :id])
  end

  def photo_info_params
    params.require(:site_memo).permit(:id,
                                      inner_sashes_attributes: [:id, :remark, inner_sash_photos_attributes:[ :file_name ]])
  end
end