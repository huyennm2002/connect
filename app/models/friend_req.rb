class FriendReq < ApplicationRecord
  belongs_to :to_user, class_name: 'User', inverse_of: :received_reqs
  belongs_to :from_user, class_name: 'User', inverse_of: :sent_reqs
  # validates :user, presence: true
end
