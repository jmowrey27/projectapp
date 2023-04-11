class Page < ApplicationRecord
    belongs_to :category
    has_one_attached :background_image
end
