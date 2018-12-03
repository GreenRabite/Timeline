class AddNotNullToFamilyTreeId < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :family_tree_id, :integer, array: true, null: false
  end
end
