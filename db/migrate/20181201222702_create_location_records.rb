class CreateLocationRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :location_records do |t|
      t.integer :person_id, null: false
      t.string :location, null: false
      t.string :period, null: false
      t.timestamps
    end
  end
end
