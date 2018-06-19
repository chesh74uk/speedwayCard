class Meeting < ApplicationRecord
    validates :date, :home_team, :away_team, presence: true
end
