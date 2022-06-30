class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  devise :database_authenticatable, :registerable, :trackable ,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook github] 

  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  #for likes model
  has_many :submitted_likes, class_name: "Like", foreign_key: :user_id
  has_many :likes, as: :likeable

  has_many :sent_reqs, class_name: "FriendReq", dependent: :destroy, foreign_key: :from_user_id
  has_many :received_reqs, class_name: "FriendReq", dependent: :destroy, foreign_key: :to_user_id

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  mount_uploader :avatar, AvatarUploader #upload avatar

  validates_confirmation_of :password 
  validates_processing_of :avatar
  validate :avatar_size_validation

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      
      user.email = auth.info.email 
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image if auth.info.image?# assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
      # binding.pry
    end
  end

  def self.new_with_session(params, session)
    
    super.tap do |user|
      # binding.pry
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.github_data"] && session["devise.github_data"]["info"]
        user.email = data["email"] if user.email.blank?
      end
    end
    
  end

  
private
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

  

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
