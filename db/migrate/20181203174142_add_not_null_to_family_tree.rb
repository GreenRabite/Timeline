class AddNotNullToFamilyTree < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :family_tree_id, :integer, null: false
  end
end
