class CommunitiesController < ApplicationController

	def index
	end

	def show
		@community = Community.find(params[:id])
	end

	def new
		@key = rand(100000..999999).to_s
		@community = Community.new
	end

	def create
		if @community = Community.create(community_params)
			redirect_to community_path(@community)
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
