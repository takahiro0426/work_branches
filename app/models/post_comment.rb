class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :community_post

  validates :comment, presence: true, length: { maximum: 30 }
end
