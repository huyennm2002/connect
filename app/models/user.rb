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

  has_many :sent_reqs, class_name: "FriendReq", dependent: :destroy
  has_many :received_reqs, class_name: "FriendReq", dependent: :destroy

  has_many :friendships, dependent: :destroy

  has_many :friends
  
  mount_uploaders :avatar, AvatarUploader #for uploading avatars

  def self.search_users(user_name)
    if user_name
        user_name.downcase!
        where('LOWER(name) LIKE ?', "%#{user_name}%")
    else
        flash[:error] = "No user"
        redirect_to root_path
    end
  end
end
