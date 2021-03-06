class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  has_many :user_communities, dependent: :destroy
  has_many :community_posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  enum role: { guest: 1, member: 2, host: 3 }
end
