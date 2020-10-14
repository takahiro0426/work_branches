class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :community_key, null: false, unique: true
      t.string :community_name, null: false
      t.text :community_info

      t.timestamps
    end
  end
end
