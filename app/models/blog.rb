class Blog < ApplicationRecord
    has_rich_text :body
    belongs_to :user
    has_many :blog_comment,dependent: :destroy
    has_many :blog_likes
    has_many :blog_liked_users, through: :blog_likes, source: :user

    with_options presence: true do
        validates :title
        validates :body,length: { minimum: 141 }
    end


end
