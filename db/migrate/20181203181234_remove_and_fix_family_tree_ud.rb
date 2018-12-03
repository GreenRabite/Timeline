class RemoveAndFixFamilyTreeUd < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :family_tree_id
    add_column :people, :family_tree_id, :integer, array: true
  end
end
