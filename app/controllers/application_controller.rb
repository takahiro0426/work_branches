class ApplicationController < ActionController::Base
	#bootstrapのflash keyを許可してます
	add_flash_types :success, :info, :warning, :danger

	before_action :user_communities_index, if: :user_signed_in?

	def user_communities_index
		@community_in_entries = UserCommunity.where(user_id: current_user.id)
		@user_communities = Community.where(id: @community_in_entries.pluck(:community_id)).order(updated_at: :asc)
	end

end
