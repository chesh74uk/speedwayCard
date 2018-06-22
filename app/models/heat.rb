class Heat < ApplicationRecord
  belongs_to :meeting
  validates :meeting_id, :heat_time, presence: true
  validates :heat_number, numericality: {less_than_or_equal_to: 15}
  has_many :blues, dependent: :destroy
  accepts_nested_attributes_for :blues
  has_many :whites, dependent: :destroy
  accepts_nested_attributes_for :whites
  has_many :reds, dependent: :destroy
  accepts_nested_attributes_for :reds
  has_many :yellows, dependent: :destroy
  accepts_nested_attributes_for :yellows
end
