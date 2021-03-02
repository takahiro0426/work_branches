class CommunityPostsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def create
    post = CommunityPost.new(community_post_params)
    if post.save
      ImageTag.create_image_tag(post)
      redirect_to community_path(post.community_id), success: "投稿しました！"
    else
      @community = Community.find(params[:community_post][:community_id])
      @subscribed_user = @community.user_communities.includes(:user)
      @members = User.where(id: @subscribed_user.pluck(:user_id))
      @posts = @community.community_posts.eager_load(:user, :image_tags).order(created_at: :desc)
        .page(params[:page]).per(10).search(params[:search])
      @post_comments = PostComment.eager_load(:user).limit(8).order(created_at: :desc)
      @new_post = post
      redirect_to community_path(params[:community_post][:community_id]), danger: CommunityPost.create_error_message(post)
    end
  end

  private

  def community_post_params
    params.require(:community_post).permit(:user_id, :community_id, :image, :tag_id, :title, :caption).merge(user_id: current_user.id)
  end
end