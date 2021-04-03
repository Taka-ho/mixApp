class Movie < ApplicationRecord
  has_one_attached :movie
  has_many :movie_liked_users, through: :movie_likes, source: :user
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :movie_likes

  with_options presence: true do
        validates :title
        validates :introduction
        validates :movie

    end

    validate :movie_presence

    def movie_presence
      if movie.attached?
        if movie.content_type.in?(%('movie/mp4 movie/mov'))
          errors.add(:movie, 'にはmp4またはmovファイルを添付してください')
        end
      else
        errors.add(:movie, 'ファイルを添付してください')
      end
    end
  
    
end
