class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  has_one_attached :image
  has_many :posts
  has_many :likes
  has_many :comments, dependent: :destroy
  
 
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end


  with_options presence: true do
    validates :nickname
    validates :mania_histry
    validates :enjoy_point
    validates :email
    validates :password, length: { minimum: 6 }
  end
end
