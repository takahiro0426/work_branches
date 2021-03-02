class Community < ApplicationRecord
  has_many :community_posts, dependent: :destroy
  has_many :user_communities, dependent: :destroy
  attachment :image
  validates :community_name, presence: true, length: { maximum: 20 }
  validates :community_key, uniqueness: true
  validates :community_info, length: { maximum: 400 }

  def self.create_new_community_key
    new_key = random_number.to_s
    while already_exists?(new_key) do
      new_key = random_number.to_s
    end
    new_key
  end

  def self.random_number
    rand(100000..999999)
  end

  def self.already_exists?(key)
    already_saved_community_keys.include?(key)
  end

  def self.already_saved_community_keys
    all.pluck(:community_key)
  end

  def self.create_error_message(community)
    if community.community_info.length >= 400
      error_massage = "コミュニティの説明は”400文字以内”で記入して下さい"
    elsif community.community_name.length >= 20
      error_massage = "コミュニティの名前は”20文字以内”で記入して下さい"
    else
      error_massage = "コミュニティの名前を記入して下さい"
    end
  end

end

