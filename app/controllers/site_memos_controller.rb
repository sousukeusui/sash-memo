class SiteMemosController < ApplicationController

  def index(site_id:)
    @site = Site.find(site_id)
    @site_memos = @site.site_memos
  end

  def new_step1(site_id:)
    @@site_id = site_id
  end

  def divide_form_by(kind_number:)
    construction_kind = ConstructionKind.find_by(kind_number: kind_number)
    
    @@site_memo = SiteMemo.new(
      construction_kind_id: construction_kind.id,
      room: '1Fリビング',
      site_id: @@site_id
    )
    
    redirect_to site_memos_new_step1_path(@@site_id), notice: @@site_memo.errors.full_messages unless @@site_memo.valid?

    case kind_number
      when 'inner_sash'
        redirect_to site_memos_new_step2_inner_sash_path
    end
  end

  def new_step2_inner_sash
    
  end

  def new_step3_inner_sash(room:, width_up_size:, width_middle_size:, width_down_size:,
                            height_left_size:, height_middle_size:, height_right_size:,
                            height_frame_depth:, width_frame_depth:)
    @@site_memo.room = room
  end

end
