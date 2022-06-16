class Office < ApplicationRecord
    validates :name, :description, presence: true
    has_one :members
end
