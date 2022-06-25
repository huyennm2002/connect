class Comment < ApplicationRecord
    belongs_to :user

    belongs_to :commentable, polymorphic: true #belongs to post

    has_many :comments, as: :commentable, dependent: :destroy

    has_many :likes, as: :likable, dependent: :destroy

    validates :body, presence: true
end
