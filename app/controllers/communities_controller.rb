class CommunitiesController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def show
		@community = Community.find(params[:id])
		@members = @community.user_communities.includes(:user)
		@member_names = User.where(id: @members.pluck(:user_id))
		@posts = @community.community_posts.order(created_at: :desc)
		@new_post = CommunityPost.new
	end

	def new
		@key = rand(100000..999999).to_s
		@community = Community.new
	end

	def create
		community = Community.new(community_params)
		if community.save
			user_community = UserCommunity.new
			user_community.user_id = current_user.id
			user_community.community_id = community.id
			user_community.is_role = 3
			user_community.save
			redirect_to community_path(community)
		else
			@key = rand(100000_999999).to_s
			@community = Community.new
			render :new
		end
	end

	def edit
	end

	private
	def community_params
		params.require(:community).permit(:community_name, :community_key, :community_info)
	end
end
