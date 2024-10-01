class Customer < ApplicationRecord
  has_many :dogs

  validates :email, presence: true, uniqueness: true
end
