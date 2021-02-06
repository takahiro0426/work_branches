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
      @posts = @community.community_posts.order(created_at: :desc).page(params[:page]).per(100).search(params[:search])
      @new_post = post
      flash.now[:danger] = CommunityPost.create_error_message(post)
      render 'communities/show'
    end
  end

  private

  def community_post_params
    params.require(:community_post).permit(:user_id, :community_id, :image, :tag_id, :title, :caption).merge(user_id: current_user.id)
  end
end