class CommunityPost < ApplicationRecord
	belongs_to :user
	belongs_to :community
	attachment :image

	validates :title, presence: true, length: { maximum: 20 }
	validates :caption, presence: true, length: { maximum: 200 }
end
