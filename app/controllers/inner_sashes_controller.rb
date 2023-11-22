class InnerSashesController < ApplicationController
  def new_step2(site_id:)
    #下書きがあれば下書きからデータを取ってくる処理を追加
    @site_id = site_id
  end

  def new_step3(site_id:)
    @site_memo = SiteMemo.find_by(site_id: site_id)
  end

  def new_step4(site_id:)
    
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

  private
  def basic_info_params
    params.require(:site_memo).permit(:id,
                                      inner_sashes_attributes: [:sash_type, :color, :number_of_shoji, :hanging_origin, :id])
  end
end