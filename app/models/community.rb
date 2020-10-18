class Community < ApplicationRecord
	has_many :community_posts
	has_many :user_communities
end
