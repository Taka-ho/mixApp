class Blog < ApplicationRecord
    has_rich_text :body
    belongs_to :user

    validates :body, presence: true
end
