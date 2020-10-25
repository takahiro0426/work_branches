class CommunityPostsController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def show
	end

	# def new
	# 	@posts = @community.community_posts.order(created_at: :desc)
	# 	@new_post = CommunityPost.new
	# end

	# def create
	# 	post = CommunityPost.new(community_post_params)
	# 	if post.save
	# 		redirect_to community_path(post.community_id)
	# 	else
	# 		@community = Community.find(params[:community_post][:community_id])
	# 		@subscribed_user = @community.user_communities.includes(:user)
	# 		@members = User.where(id: @subscribed_user.pluck(:user_id))
	# 		@posts = @community.community_posts.order(created_at: :desc)
	# 		@new_post = CommunityPost.new
	# 		render template: "communities/show"
	# 	end
	# end

	# def edit
	# end

	# private
	# def community_post_params
	# 	params.require(:community_post).permit(:user_id, :community_id, :image, :tag_id, :title, :caption).merge(user_id: current_user.id)
	# end
end