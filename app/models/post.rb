class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    
    validates :content, presence: true
    has_many :likes
  has_many :liked_users, through: :likes, source: :user
end