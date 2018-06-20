class Heat < ApplicationRecord
  belongs_to :meeting
  validates :meeting_id, :heat_time, presence: true
  has_many :gates, dependent: :destroy
  accepts_nested_attributes_for :gates
end
