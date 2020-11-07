class CreateImageTags < ActiveRecord::Migration[5.2]
  def change
    create_table :image_tags do |t|
      t.references :community_post, foreign_key: true
      t.string :tag

      t.timestamps
    end
  end
end
