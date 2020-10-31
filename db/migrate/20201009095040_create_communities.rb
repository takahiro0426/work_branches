class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :community_key, null: false
      t.string :community_name, null: false
      t.text :community_info

      t.timestamps
    end
      add_index :communities, :community_key, unique: true
  end
end
