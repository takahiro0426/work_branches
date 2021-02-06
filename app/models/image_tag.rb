class ImageTag < ApplicationRecord
  belongs_to :community_post

  def self.create_image_tag(post)
    if post.image
      image_tag = Vision.get_image_data(post.image)
      post.image_tags.create(tag: image_tag)
    else
      post.image_tags.create(tag: "No Image")
    end
  end

end
