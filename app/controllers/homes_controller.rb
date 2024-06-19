class HomesController < ApplicationController
  def top
    redirect_to sites_index_path if user_signed_in?
  end
end
