class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_one_attached :image
  has_many :posts
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :movies
  
 
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  def liked_by?(movie_id)
    likes.where(movie_id: movie_id).exists?
  end


  with_options presence: true do
    validates :nickname
    validates :mania_histry
    validates :enjoy_point
    validates :email
    validates :password, length: { minimum: 6 }

  end
  validate :image_presence, :image_size, :image_length
  
  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end

  def image_size
    image.each do |image|
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:images, "は1つのファイル5MB以内にしてください")
      end
    end
  end

  def image_length
    if image.length > 1
      image.purge
      errors.add(:image, "は1枚だけです")
    end
  end
end