class FriendReq < ApplicationRecord
  belongs_to :to_user, class_name: 'User'
  belongs_to :from_user, class_name: 'User'
  # validates :user, presence: true
end
