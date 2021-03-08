class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user, optional: true
    
    validates :content, presence: true
end
