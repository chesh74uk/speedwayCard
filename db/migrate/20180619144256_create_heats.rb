class CreateHeats < ActiveRecord::Migration[5.2]
  def change
    create_table :heats do |t|
      t.decimal :heat_time
      t.integer :heat_number
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
