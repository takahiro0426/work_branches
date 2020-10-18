class UserCommunitiesController < ApplicationController

	def index
	end

	def show

	end

	def edit
	end

	def new
		@user_community = UserCommunity.new
	end

	def create
		community = Community.find_by(community_key: params[:community_key])
		user_community = UserCommunity.new
		user_community.user_id = current_user.id
		user_community.community_id = community.id
		user_community.is_role = 3
		user_community.save
		redirect_to user_communities_path
	end






	private
	# def user_community_params
	# 	params.require(:user_community).permit(:community_id, :is_activ, :id_role).merge(user_id: current_user.id)
	# end
end
