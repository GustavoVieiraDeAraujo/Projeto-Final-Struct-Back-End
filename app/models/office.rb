class Office < ApplicationRecord
    validates :name, :description, presence: true
    has_many :members, dependent: :destroy
end
