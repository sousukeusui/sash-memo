class InnerSashesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_inner_sash, only: [:show, :switch, :navigate_page, :update_order, :update]
  before_action :set_site_memo, only: [:new_step2, :new_step3, :new_step4, :new_step5,
                                       :new_append_room, :new_append_shoji_and_glass, 
                                       :new_append_photo_and_others, :new_append_basic_info, :new_comfirmation]
  before_action :load_inner_sashes, only: [:new_step2, :new_append_room, :new_step3, :new_append_basic_info, :new_step4,
                                          :new_append_shoji_and_glass, :new_step5, :new_append_photo_and_others,
                                          :new_comfirmation]

  def new_step2
    # fields_forを使わないのはinner_sashのフォームは一つにしたいため
    @inner_sash = InnerSash.new
    @site_memo.update_status(action: action_name)
  end

  def new_append_room
    p @site_memo.id
    @inner_sash = InnerSash.new(inner_sash_params.merge(site_memo_id: @site_memo.id))
    @inner_sash = InnerSash.new if @inner_sash.save
    # 保存失敗したら、パラメーターを元に作ったインスタンス返す
  end

  def new_step3
    @site_memo.update_status(action: action_name)
  end

  def new_append_basic_info
    return redirect_to inner_sashes_new_step4_path if @site_memo.update(site_memo_params)
    return render "new_step3", status: :unprocessable_entity
  end

  def new_step4
    @site_memo.update_status(action: action_name)
  end

  def new_append_shoji_and_glass
    return redirect_to inner_sashes_new_step5_path if @site_memo.update(site_memo_params)
    return render "new_step4", status: :unprocessable_entity
  end

  def new_step5
    @site_memo.update_status(action: action_name)
  end

  def new_append_photo_and_others
    return redirect_to inner_sashes_new_comfirmation_path if @site_memo.update(site_memo_params)
    return render 'new_step5', status: :unprocessable_entity
  end

  def new_comfirmation
    @site_memo.update_status(action: action_name)
  end
  
  def show(id:)
    @inner_sash = InnerSash.preload(site_memo: :site).find(id)
    @order_key = get_opposite_order_key(inner_sash: @inner_sash)
  end

  def update_order(id:, order:)
    @inner_sash.update!(order: order)
    @order_key = get_opposite_order_key(inner_sash: @inner_sash)
    flash.now.notice = "#{InnerSash.orders_i18n[order.to_sym]}にしました"
  end

  def destroy(id:)
    inner_sash = InnerSash.find(id)
    inner_sash.destroy_last_with(site_memo: inner_sash.site_memo)
    redirect_to site_memos_index_path(site_id: inner_sash.site_memo.site_id), notice: "メモを削除しました"
  end

  def navigate_page(id:)
    @inner_sash = InnerSash.preload(site_memo: :site).find(id.to_i)
    @order_key = get_opposite_order_key(inner_sash: @inner_sash)
  end

  def switch(template:, id:)
     # templateはbasic_info、shoji_and_glass、photo_and_others
     # h_cross_drawing w_cross_drawing　のどれか
    # render "#{template}", content_type: 'text/vnd.turbo-stream.html'
    render "#{template}"
  end

  def update(id:)
    @inner_sash.update!(inner_sash_params)

    # templateはbasic_info、shoji_and_glass、photo_and_othersのどれか
    template = inner_sash_params[:template]
    flash.now.notice = I18n.t("inner_sashes.update.#{template}") + "を更新しました"
    render "#{template}", content_type: 'text/vnd.turbo-stream.html'
  end

private

  def inner_sash_params
    params.require(:inner_sash).permit(:room, :number_of_shoji, :width_up_size, :width_down_size, :width_middle_size, 
                                      :height_left_size, :height_middle_size, :height_right_size, :width_frame_depth, :height_frame_depth,
                                      :sash_type, :color, :number_of_shoji, :hanging_origin, :is_flat_bar, :is_adjust, 
                                      :glass_thickness, :glass_kind, :glass_color, :is_low_e, :key_height, :middle_frame_height,
                                      :template, photos_attributes: [:id, :file_name, :_destroy])
  end

  def site_memo_params
    params.require(:site_memo).permit(:remark, inner_sashes_attributes: [:id, :room, :number_of_shoji, :width_up_size, :width_down_size, :width_middle_size, 
                                      :height_left_size, :height_middle_size, :height_right_size, :width_frame_depth, :height_frame_depth,
                                      :color, :is_flat_bar, :hanging_origin, :key_height, :sash_type, :middle_frame_height, :is_adjust,
                                      :glass_color, :glass_thickness, :glass_kind, :is_low_e, photos_attributes: [:id, :file_name, :_destroy]])
  end

  def load_inner_sashes
    @inner_sashes = InnerSash.eager_load(:site_memo, :photos).where(site_memo: {kind: 'inner_sash', site_id: session[:site_id]})
  end

  def set_site_memo
    @site_memo = SiteMemo.find_by(kind: 'inner_sash', site_id: session[:site_id])
    p @site_memo
  end

  def correct_inner_sash(id:)
    @inner_sash = InnerSash.find(id)
    redirect_to root_path if @inner_sash.site_memo.site.user_id != current_user.id
  end
end