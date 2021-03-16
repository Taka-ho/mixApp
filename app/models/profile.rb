class Profile < ApplicationRecord
    has_one_attached :image
      belongs_to :user

      validates :name, presence: true
      validates :mania_histry, presence: true
      validates :enjoy_point, presence: true
    
    end