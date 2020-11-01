class UserCommunity < ApplicationRecord
	belongs_to :user
	belongs_to :community

	# def errors
	# 	if @user_communities.include?(request_community)
	# 		@repuest_community = UserCommunity.new
	# 		flash.now[:danger] = "参加済みのコミュニティです"
	# 		render :new
	# 	elsif params[:community_key].blank?
	# 		@repuest_community = UserCommunity.new
	# 		flash.now[:danger] = "keyを入力して下さい"
	# 		render :new
	# 	elsif request_community.blank?
	# 		@repuest_community = UserCommunity.new
	# 		flash.now[:danger] = "無効なkeyです"
	# 		render :new
	# 	end
	# end
end
