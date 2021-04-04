class Movie < ApplicationRecord
  has_one_attached :movie
  has_many :movie_liked_users, through: :movie_likes, source: :user
  has_many :movie_likes
  has_many :movie_comments, dependent: :destroy
  belongs_to :user

  with_options presence: true do
        validates :title
        validates :introduction

    end


    validate :movie_presence

    def movie_presence
    if movie.attached?
      if !movie.content_type.in?(%('movie/mp4 movie/mov'))
        errors.add(:movie,'こちらで投稿できるのはmp4またはmovファイルです')
     end
   end
 end


end
