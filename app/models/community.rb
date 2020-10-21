class Community < ApplicationRecord
	has_many :community_posts, dependent: :destroy
	has_many :user_communities, dependent: :destroy
	attachment :image


end