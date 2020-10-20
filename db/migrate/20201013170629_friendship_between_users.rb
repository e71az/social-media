class FriendshipBetweenUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships, primary_key: [:user_id, :friend_id] do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.boolean :status, null: false, default: false
      t.timestamps
    end
  end
end
