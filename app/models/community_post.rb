class CommunityPost < ApplicationRecord
	belongs_to :user
	belongs_to :community
	has_many :post_comments, dependent: :destroy
	has_many :image_tags, dependent: :destroy
	attachment :image
	validates :title, presence: true, length: { maximum: 20 }
	validates :caption, length: { maximum: 200 }
	# communities#showの検索機能
	def self.search(search)
        if search
          where([' title LIKE ?', "%#{search}%"])
        else
          all
        end
    end
end
