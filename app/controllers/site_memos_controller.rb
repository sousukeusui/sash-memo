class SiteMemosController < ApplicationController
  permits :kind,
      inner_sashs_attributes: [:room, :width_up_size, :width_middle_size, :width_down_size,
                                :height_left_size, :height_middle_size, :height_right_size,
                                :height_frame_depth, :width_frame_depth, :color, :_destroy]

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
    @inner_sashs = @site_memo.inner_sashs.build
  end

  def new_step3_inner_sash(site_memo)
    cache_site_memo = Rails.cache.read('site_memo')
    new_site_memo = SiteMemo.new(site_memo)
    cache_site_memo.inner_sashs = new_site_memo.inner_sashs
    #colorとnumber_of_shoji、flat_bar_sizeは除いている
    if cache_site_memo.valid?
      Rails.cache.write('site_memo', cache_site_memo)
    else
      flash[:notice] = cache_site_memo.errors.full_messages
    end
  end

  def new_step4_inner_sash

  end

end
