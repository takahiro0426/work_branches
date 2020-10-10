class UserCommunity < ApplicationRecord
	belongs_to :user
	has_many :communities
end
