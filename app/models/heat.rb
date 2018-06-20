class Heat < ApplicationRecord
  belongs_to :meeting
  validates :meeting_id, presence: true
end
