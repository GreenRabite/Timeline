class AddFamilyName < ActiveRecord::Migration[5.1]
  def change
    add_column :family_trees, :name, :string, null: false
    add_column :family_trees, :family_image, :string
  end
end
