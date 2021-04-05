class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  validate :images_presence

  def images_presence
    images.each do |image|
      next unless images.attached?

      errors.add(:images, 'こちらで投稿できるのはjpegまたはpngファイルです') unless image.blob.content_type.in?(%('images/jpeg images/png'))
    end
  end
end
