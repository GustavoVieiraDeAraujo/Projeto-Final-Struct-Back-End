class Partnership < ApplicationRecord
    validates :name, :link, presence: true

    has_many_attached :images
end
