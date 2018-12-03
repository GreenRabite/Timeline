class ChangeDataTypeForFamTree < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :family_tree_id
  end
end
