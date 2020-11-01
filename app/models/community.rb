class Community < ApplicationRecord
	has_many :community_posts, dependent: :destroy
	has_many :user_communities, dependent: :destroy
	attachment :image
	validates :community_name, presence: true, length: { maximum: 20 }
    validates :community_key, uniqueness: true
    validates :community_info, length: { maximum: 400 }


end