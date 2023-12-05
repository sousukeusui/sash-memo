class InnerSashesController < ApplicationController
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

  def new_completion
    
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