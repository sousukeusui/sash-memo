class SiteMemosController < ApplicationController

  def index(site_id:)
    @site = Site.find(site_id)
    @site_memos = @site.site_memos
  end

  def new_step1(site_id:)
    Rails.cache.write('site_id', site_id)
  end

  def divide_form_by(kind:)
    #site_idをよみこむ
    site_id = Rails.cache.read('site_id')
    
    site_memo = SiteMemo.new(
      kind: kind,
      room: '1Fリビング',
      site_id: site_id 
    )
    
    redirect_to site_memos_new_step1_path(site_id), notice: site_memo.errors.full_messages unless site_memo.valid?
    #site_memoの情報を一時保存
    Rails.cache.write('site_memo', site_memo)

    case kind
      when 'inner_sash'
        redirect_to site_memos_new_step2_inner_sash_path
    end
  end

  def new_step2_inner_sash
    @site_memo = SiteMemo.new
  end

  def new_step3_inner_sash(room:, width_up_size:, width_middle_size:, width_down_size:,
                            height_left_size:, height_middle_size:, height_right_size:,
                            height_frame_depth:, width_frame_depth:)
    @site_memo = Rails.cache.read('site_memo')
    @site_memo.room = room

    inner_sash = @site_memo.build_inner_sash(
      width_up_size: width_up_size,
      width_middle_size: width_middle_size,
      width_down_size: width_down_size,
      height_left_size: height_left_size,
      height_middle_size: height_middle_size,
      height_right_size: height_right_size,
      height_frame_depth: height_frame_depth,
      width_frame_depth: width_frame_depth,
      color: 1,
      number_of_shoji: 2
    )


    if @site_memo.valid? && inner_sash.valid?
      Rails.cache.write('inner_sash', inner_sash)
    else
      redirect_to site_memos_new_step2_inner_sash_path notice: inner_sash.errors.full_messages
    end
  end

  def new_step4_inner_sash

  end

end
