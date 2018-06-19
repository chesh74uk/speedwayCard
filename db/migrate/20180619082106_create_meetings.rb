class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.date :date
      t.string :home_team
      t.string :away_team
      t.integer :home_score
      t.integer :away_score

      t.timestamps
    end
  end
end
