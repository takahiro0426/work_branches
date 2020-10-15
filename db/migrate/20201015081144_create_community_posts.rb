class CreateCommunityPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :community_posts do |t|
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true
      t.string :image_id
      t.integer :tag_id
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
