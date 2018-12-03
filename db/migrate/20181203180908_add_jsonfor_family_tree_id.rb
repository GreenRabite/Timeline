class AddJsonforFamilyTreeId < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :family_tree_id, :json
  end
end
