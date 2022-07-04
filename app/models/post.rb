class Post < ApplicationRecord
    belongs_to :user 
    
    has_many :comments, as: :commentable, dependent: :destroy
    
    has_many :likes, as: :likable, dependent: :destroy

    mount_uploaders :images, ImagesUploader

    validates :content, presence: true
end
