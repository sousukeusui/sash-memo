class SiteMemosController < ApplicationController
  before_action :new_step1_validation, only: :divide_form_by_kind

  def index(site_id:)
    @site = Site.find(site_id)
    @site_memos = @site.site_memos
  end

  def new_step1(site_id:)
    session[:site_id] = site_id
  end

  def divide_form_by(kind_number:)
    case kind_number
      when 'inner_sash'
        redirect_to site_memos_new_step2_inner_sash_path
    end
  end

  def new_step2_inner_sash
    
  end

  def new_step3_inner_sash
    
  end


  private 

  def new_step1_validation(kind_number:)
    construction_kind = ConstructionKind.find_by(kind_number: kind_number)
    site_memo = SiteMemo.new(
      construction_kind_id: construction_kind.id,
      room: "洋室１",
      site_id: session[:site_id]
    )

    redirect_to site_memos_new_step1_path(session[:site_id]), notice: site_memo.errors.full_messages unless site_memo.valid?
  end
end
