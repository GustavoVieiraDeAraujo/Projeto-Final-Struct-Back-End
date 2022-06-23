class Member < ApplicationRecord
  validates :name, :age, presence: true
  belongs_to :office
  has_many :project_members, dependent: :destroy
  #has_many :projects, through: :project_members

  has_one_attached :photo
end
