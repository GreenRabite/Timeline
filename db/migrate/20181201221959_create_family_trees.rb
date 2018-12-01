class CreateFamilyTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :family_trees do |t|
      t.integer :user_id
      t.timestamps
    end
    add_index :family_trees, :user_id
  end
end
