class CreateBlues < ActiveRecord::Migration[5.2]
  def change
    create_table :blues do |t|
      t.references :heat, foreign_key: true
      t.integer :gate_number
      t.string :rider_name
      t.integer :score

      t.timestamps
    end
  end
end
