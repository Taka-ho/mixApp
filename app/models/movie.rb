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

end
