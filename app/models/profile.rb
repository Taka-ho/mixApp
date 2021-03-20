class Profile < ApplicationRecord
    has_one_attached :image
      belongs_to :user

      with_options presence: true do
      validates :name
      validates :mania_histry
      validates :enjoy_point
      end
    end