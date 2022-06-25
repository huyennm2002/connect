class CreateFriendReqs < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_reqs do |t|
      
      t.references :from_user, null: false, foreign_key: { to_table: :users }
      t.references :to_user, null: false, foreign_key: { to_table: :users }
     
      t.timestamps
    end
  end
end
