class DropHomeRiders < ActiveRecord::Migration[5.2]
  def change
    drop_table :home_riders
  end
end
