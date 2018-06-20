class CreateWhites < ActiveRecord::Migration[5.2]
  def change
    create_table :whites do |t|
      t.references :heat, foreign_key: true
      t.integer :gate_number
      t.string :rider_name
      t.integer :score

      t.timestamps
    end
  end
end
