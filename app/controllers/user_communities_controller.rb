class UserCommunitiesController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def show

	end

	def edit
	end

	def new
		@repuest_community = UserCommunity.new
	end

	def create
		request_community = Community.find_by(community_key: params[:community_key])
		if @user_communities.include?(request_community)
			@repuest_community = UserCommunity.new
			flash.now[:danger] = "参加済みのコミュニティです"
			render :new
		elsif params[:community_key].blank?
			@repuest_community = UserCommunity.new
			flash.now[:danger] = "keyを入力して下さい"
			render :new
		elsif request_community.blank?
			@repuest_community = UserCommunity.new
			flash.now[:danger] = "無効なkeyです"
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



	private
	# def user_community_params
	# 	params.require(:user_community).permit(:community_id, :is_activ, :id_role).merge(user_id: current_user.id)
	# end
end
