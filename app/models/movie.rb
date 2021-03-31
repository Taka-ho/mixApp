class Movie < ApplicationRecord
    belongs_to :user
    has_one_attached :movie
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

    with_options presence: true do
        validates :title
        validates :introduction
        validates :movie

    end

    validate :movie_type

  def movie_type
    movie.each do |movie|
      if !movie.blob.content_type.in?(%('image/mp4 image/mov'))
        movie.purge
        errors.add(:movies, 'はmp4またはmov形式でアップロードしてください')
      end
    end
  end
end
