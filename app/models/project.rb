class Project < ApplicationRecord
    validates :name, :link, :description, presence: true
    has_many :project_members, dependent: :destroy

    has_one_attached :photo
end
