class Friendship < ApplicationRecord
  after_destroy :destroy_inverse_relationship
  
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def destroy_inverse_relationship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end
