class Movie < ApplicationRecord
  has_one_attached :movie
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  belongs_to :user

  with_options presence: true do
        validates :title
        validates :introduction
        validates :movie

    end

    validate :movie_presence

    def movie_presence
      if movie.attached?
        if !movie.content_type.in?(%('movie/mp4 movie/mov'))
          errors.add(:image, 'にはmp4またはmovファイルを添付してください')
        end
      else
        errors.add(:image, 'ファイルを添付してください')
      end
    end
  
    
end
