class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.date :birthday
      t.date :deathday
      t.integer :family_tree_id
      t.string :gender
      t.string :profile_img
      t.timestamps
    end
    add_index :people, :first_name
    add_index :people, :last_name
    add_index :people, :family_tree_id
  end
end
