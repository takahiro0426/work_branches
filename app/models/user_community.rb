class UserCommunity < ApplicationRecord
	belongs_to :user
	belongs_to :community

	def self.error_massege(request, request_key, user_communities)
		if request_key.blank?
			error_massage = "keyを入力して下さい"
		elsif request.nil?
			error_massage = "無効なkeyです"
		elsif user_communities.include?(request)
			error_massage = "参加済みのコミュニティです"
		end
	end

end
