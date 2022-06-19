class Office < ApplicationRecord
    validates :name, :description, presence: true
    has_many :member, dependent: :destroy
end
