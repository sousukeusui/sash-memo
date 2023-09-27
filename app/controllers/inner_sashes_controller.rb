class InnerSashesController < ApplicationController
  def new_step2(site_id:)
    #下書きがあれば下書きからデータを取ってくる処理を追加
    @site_id = site_id
  end

  def new_step3
   
  end

  def room_append(room:, width_up_size:, width_middle_size:, width_down_size:,
                  height_left_size:, height_right_size:, height_middle_size:,
                  height_frame_depth:, width_frame_depth:, site_id:)
    #インスタンスを作成
    site_memo = SiteMemo.new(kind: :inner_sash, site_id: site_id)
    inner_sash = site_memo.inner_sashes.build(room: room, width_up_size: width_up_size, width_middle_size: width_middle_size, width_down_size: width_down_size,
                                height_left_size: height_left_size, height_middle_size: height_middle_size, height_right_size: height_right_size,
                                height_frame_depth: height_frame_depth, width_frame_depth: width_frame_depth)
    return redirect_to inner_sashs_new_step2_path, notice: inner_sash.errors.full_messages unless inner_sash.save!
    @inner_sash = inner_sash.attributes
  end
end
