class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy


 
    validates :content, presence: true

    validate :image_presence, :image_size, :image_length


    def image_presence
        if images.attached?
          if !images.blobs.content_type.in?(%('image/jpeg image/png'))
            errors.add(:images, 'にはjpegまたはpngファイルを添付してください')
          end
        else
          errors.add(:image, 'ファイルを添付してください')
        end
      end

  def image_size
    images.each do |image|
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:images, "は1つのファイル5MB以内にしてください")
      end
    end
  end

  def image_length
    if images.length > 1
      images.purge
      errors.add(:images, "は1枚だけです")
    end
  end

end