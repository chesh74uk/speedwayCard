class AddHomeRidersToMeeting < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :home_rider_1, :string
    add_column :meetings, :home_rider_2, :string
    add_column :meetings, :home_rider_3, :string
    add_column :meetings, :home_rider_4, :string
    add_column :meetings, :home_rider_5, :string
    add_column :meetings, :home_rider_6, :string
    add_column :meetings, :home_rider_7, :string
  end
end
