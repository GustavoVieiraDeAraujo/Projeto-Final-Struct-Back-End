class Contact < ApplicationRecord
  validates :email , uniqueness: true
  validates :name, :email, :about, presence: true

  belongs_to :service
end
