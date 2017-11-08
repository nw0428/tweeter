class FixIndexesOnUserUser < ActiveRecord::Migration[5.1]
  def change
    remove_index :users_users, :follower_id
    remove_index :users_users, :followee_id

    add_index :users_users, :follower_id
    add_index :users_users, :followee_id
  end
end
