class CommunitiesController < ApplicationController
  before_action :authenticate_user!
  def show
    @community = Community.find(params[:id])
    @subscribed_user = @community.user_communities.includes(:user)
    @members = User.where(id: @subscribed_user.pluck(:user_id))
    @posts = @community.community_posts.order(created_at: :desc).page(params[:page]).per(100).search(params[:search])
    @new_post = CommunityPost.new
    if params[:post_community_id]
      @select_post = CommunityPost.find(params[:post_community_id])
      @comments = @select_post.post_comments.limit(8).order(created_at: :desc)
      @new_comment = PostComment.new
    end
  end

  def new
    @new_key = Community.create_new_community_key
    @new_community = Community.new
  end

  def create
    community = Community.new(community_params)
    if community.invalid?
      flash.now[:danger] = Community.create_error_message(community)
      @new_community = Community.new(community_params)
      @new_key = community.community_key
      render :new
    else
      community.save
      UserCommunity.create(user_id: current_user.id, community_id: community.id, is_role: 3)
      redirect_to community_path(community), success: "【#{community.community_name}】を作成しました！"
    end
  end

  def edit
  end

  private

  def community_params
    params.require(:community).permit(:community_name, :community_key, :community_info)
  end

end
