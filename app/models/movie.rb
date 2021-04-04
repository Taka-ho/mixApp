class Movie < ApplicationRecord
  has_one_attached :movie
  has_many :movie_liked_users, through: :movie_likes, source: :user
  has_many :movie_likes
  has_many :movie_comments, dependent: :destroy
  belongs_to :user

  with_options presence: true do
        validates :title
        validates :introduction
        validates :movie

    end

    validate :movies_presence

    def movies_presence
    if movie.attached?
      if !movie.blob.content_type.in?(%('movies/mp4 movies/mov'))
        errors.add(:movies,'こちらで投稿できるのはmp4またはmovファイルです')
     end
   end
 end
end
