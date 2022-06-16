class Member < ApplicationRecord
  validates :name, :age, presence: true
  belongs_to :office
  has_many :projects
end
