class Administrator < ApplicationRecord
  
  acts_as_token_authenticatable

  validates :name, presence: true
  validates :email , uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
