class CreateUserCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_communities do |t|
      t.integer :user_id
      t.integer :community_id
      t.boolean :is_active, default: true
      t.integer :is_role

      t.timestamps
    end
  end
end
