class Dog < ApplicationRecord
  has_and_belongs_to_many :shifts
  belongs_to :customer

  enum status: %i[not_picked_up going_to_field at_field going_home dropped_off]

  validates_presence_of :name, :breed, :days_of_week, :time_period
end