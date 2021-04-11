class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :content,length: { maximum: 140 }, presence: true

  validates :images, blob: { content_type: :image } 
  end

