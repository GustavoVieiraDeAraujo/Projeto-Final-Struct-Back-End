class Service < ApplicationRecord
    validates :name, :description, presence: true

    has_many_attached :images
end
