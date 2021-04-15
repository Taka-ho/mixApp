class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts
  has_many :likes
  has_many :comments, dependent: :destroy
  has_many :movie_likes
  has_many :movies
  has_many :movie_comments, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :blog_likes
  has_many :blog_comments, dependent: :destroy

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  def movie_liked_by?(movie_id)
    movie_likes.where(movie_id: movie_id).exists?
  end

  def blog_liked_by?(blog_id)
    blog_likes.where(blog_id: blog_id).exists?
  end

  with_options presence: true do
    validates :nickname
    validates :mania_histry
    validates :enjoy_point
    validates :email
    validates :password, length: { minimum: 6 }
  end

  validate :image_presence

  def image_presence
    if image.attached?
      if !image.blob.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    end
  end
end
