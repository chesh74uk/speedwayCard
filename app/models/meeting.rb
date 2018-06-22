class Meeting < ApplicationRecord
    has_many :heats, dependent: :destroy
    validates :date, :home_team, :away_team, presence: true
    

end
