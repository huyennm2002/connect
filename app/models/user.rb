class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy

  #for likes model
  has_many :submitted_likes, class_name: "Like", foreign_key: :user_id
  has_many :likes, as: :likeable

  has_many :friends, class_name: "User"

  has_many :sent_reqs, class_name: "FriendReq"
  has_many :received_reqs, class_name: "FriendReq"
end
