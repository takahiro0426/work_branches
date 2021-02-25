class CommunitiesController < ApplicationController
  before_action :authenticate_user!
  def show
    @community = Community.find(params[:id])
    @subscribed_user = @community.user_communities.includes(:user)
    @members = User.where(id: @subscribed_user.pluck(:user_id))
  end

  def new
    @new_key = Community.create_new_community_key
    @new_community = Community.new
  end

  def create
    community = Community.new(community_params)
    if community.save
      UserCommunity.create(user_id: current_user.id, community_id: community.id, is_role: 3)
      redirect_to community_path(community), success: "【#{community.community_name}】を作成しました！"
    else
      flash.now[:danger] = Community.create_error_message(community)
      @new_community = community
      @new_key = Community.create_new_community_key
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
