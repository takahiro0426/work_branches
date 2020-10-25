class CommunitiesController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def show
		@community = Community.find(params[:id])
		@subscribed_user = @community.user_communities.includes(:user)
		@members = User.where(id: @subscribed_user.pluck(:user_id))
		@posts = @community.community_posts.order(created_at: :desc)
		@new_post = CommunityPost.new
		if params[:post_community_id]
			@select_post = CommunityPost.find(params[:post_community_id])
			@comments = @select_post.post_comments
			@new_comment = PostComment.new
		end
	end

	def new
		@key = rand(100000..999999).to_s
		@new_community = Community.new
	end

	def create
		if params[:community_key]
			community = Community.new(community__params)
			if community.save
				user_community = UserCommunity.new
				user_community.user_id = current_user.id
				user_community.community_id = community.id
				user_community.is_role = 3
				user_community.save
				redirect_to community_path(community)
				# コミュニティを作ると同時に参加する
			else
				@key = rand(100000_999999).to_s
				@community = Community.new
				render :new
			end
		elsif params[:community_post]
			post = CommunityPost.new(community_post_params)
			if post.save
				redirect_to community_path(post.community_id)
			else
				@community = Community.find(params[:community_post][:community_id])
				@subscribed_user = @community.user_communities.includes(:user)
				@members = User.where(id: @subscribed_user.pluck(:user_id))
				@posts = @community.community_posts.order(created_at: :desc)
				@new_post = CommunityPost.new
				render :show
			end
		else
			comment = PostComment.create(post_comment_params)
			# 第一はcommunityの特定、第二引数は@select_postへ代入し、commentしたpost_communityを表示する処理で用います
			redirect_to community_path(params[:post_comment][:community_id], post_community_id: comment.community_post_id)
		end
	end

	def edit
	end

	private
	def community_params
		params.require(:community).permit(:community_name, :community_key, :community_info)
	end
	def community_post_params
		params.require(:community_post).permit(:user_id, :community_id, :image, :tag_id, :title, :caption).merge(user_id: current_user.id)
	end
	def post_comment_params
	params.require(:post_comment).permit(:comment, :community_post_id, :user_id).merge(user_id: current_user.id)
	end
end
