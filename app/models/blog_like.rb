class BlogLike < ApplicationRecord
    belongs_to :user
    belongs_to :blog
end
