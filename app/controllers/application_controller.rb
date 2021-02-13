class ApplicationController < ActionController::Base
  #bootstrapのflash keyを許可してます
  add_flash_types :success, :info, :warning, :danger

  before_action :user_communities_index, if: :user_signed_in?
  # @community_inentriesはsign inしている間、常に使用します。
  def user_communities_index
    @community_in_entries = Community.where(id: current_user.user_communities.includes(:community).pluck(:community_id)).order(updated_at: :desc).first(5)
  end

end
