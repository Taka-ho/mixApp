class Movie < ApplicationRecord
  has_one_attached :movie
  has_many :movie_liked_users, through: :movie_likes, source: :user
  has_many :movie_likes
  has_many :movie_comments, dependent: :destroy
  belongs_to :user
  has_many :movie_likes

  with_options presence: true do
        validates :title
        validates :introduction
    end
    validates :movie, presence: true, blob: { content_type: :video } # supported options: :image, :audio, :video, :text

  end
