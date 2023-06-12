class InnerSashsController < ApplicationController
  def new_step2
    @inner_sashes = session[:inner_sashes]
  end

  def new_step3
   
  end

  def site_append(room:, width_up_size:, width_middle_size:, width_down_size:,
                  height_left_size:, height_right_size:, height_middle_size:,
                  height_frame_depth:, width_frame_depth:)
    #インスタンスを作成
    inner_sash = InnerSash.new(room: room, width_up_size: width_up_size, width_middle_size: width_middle_size, width_down_size: width_down_size,
                                height_left_size: height_left_size, height_middle_size: height_middle_size, height_right_size: height_right_size,
                                height_frame_depth: height_frame_depth, width_frame_depth: width_frame_depth)
    return redirect_to inner_sashs_new_step2_path, notice: inner_sash.errors.full_messages unless inner_sash.valid?
    session[:inner_sashes] = [] if session[:inner_sashes].nil?
    session[:inner_sashes] << inner_sash.attributes 
    return redirect_to inner_sashs_new_step2_path, notice: '追加しました'
  end

  def session_delete
    session[:inner_sashs].clear
    redirect_to inner_sashs_new_step2_path
  end
end
