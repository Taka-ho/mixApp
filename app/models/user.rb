class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_one_attached :image
  has_many :comments       
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
 
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end


  with_options presence: true do
    validates :nickname
    validates :mania_histry
    validates :enjoy_point
    validates :email
    validates :password, length: { minimum: 6 }
  end

 
end
