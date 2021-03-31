class Movie < ApplicationRecord
    belongs_to :user
    has_one_attached :movie
    has_many :likes
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy


end
