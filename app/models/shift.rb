class Shift < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :dogs

  enum shift_type: %i[am pm]
end
