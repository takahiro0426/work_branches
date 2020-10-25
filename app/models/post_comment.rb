class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :community_post
end
