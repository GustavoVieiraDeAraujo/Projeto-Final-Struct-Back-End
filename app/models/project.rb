class Project < ApplicationRecord
    validates :name, :link, :description, presence: true
    has_many :members
end
