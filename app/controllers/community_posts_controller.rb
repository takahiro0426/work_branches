class CommunityPostsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
		post = CommunityPost.new(community_post_params)
		post.save
		redirect_to community_path(post.community_id)
	end

	def edit
	end

	private
	def community_post_params
		params.require(:community_post).permit(:user_id, :community_id, :image_id, :tag_id, :title, :caption).merge(user_id: current_user.id)
	end
end