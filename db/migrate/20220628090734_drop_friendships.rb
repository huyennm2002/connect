class DropFriendships < ActiveRecord::Migration[7.0]
  def change
    drop_table :friendships
  end
end
