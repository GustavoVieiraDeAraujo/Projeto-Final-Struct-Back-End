class Partnership < ApplicationRecord
    validates :name, :link, presence: true
end
