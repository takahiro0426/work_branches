class UserCommunitiesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @repuest_community = UserCommunity.new
  end

  def create
    request_community = Community.find_by(community_key: params[:community_key])
    if error_massage = UserCommunity.error_massege(request_community, params[:community_key], @community_in_entries)
      @repuest_community = UserCommunity.new
      flash.now[:danger] = error_massage
      render :new
    else
      UserCommunity.create(user_id: current_user.id, community_id: request_community.id, is_role: 3)
      redirect_to user_communities_path, success: "【#{request_community.community_name}】に参加しました！"
    end
  end

  # community切り替え時の処理（ログイン時に@started_sessionを特定するため）
  def update
    @session_community = Community.find(params[:id])
    @session_community_update = current_user.user_communities.find_by(community_id: @session_community).touch
    redirect_to community_path(params[:id])
  end

end
