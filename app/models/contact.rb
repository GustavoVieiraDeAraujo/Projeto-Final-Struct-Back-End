class Contact < ApplicationRecord
    validates :email , :localization , uniqueness: true
    validates :name, :localization, :email, :number, presence: true
    validates :number , length: {minimum:9, maximum:15}
    validates :number, numericality: { only_integer: true }
end