class AddAwayRidersToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :away_rider_1, :string
    add_column :meetings, :away_rider_2, :string
    add_column :meetings, :away_rider_3, :string
    add_column :meetings, :away_rider_4, :string
    add_column :meetings, :away_rider_5, :string
    add_column :meetings, :away_rider_6, :string
    add_column :meetings, :away_rider_7, :string
  end
end
