class Yellow < ApplicationRecord
  belongs_to :heat
  validates :rider_name, :score, :gate_number, presence: true
  validates :score, numericality: {less_than_or_equal_to: 3}
  validates :gate_number, numericality: {less_than_or_equal_to: 4}
end
