class ChangeRelationshipTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :relationships, :type
    add_column :relationships, :relationship_type, :string
    change_column :relationships, :beta_id, 'integer USING CAST(beta_id AS integer)'
  end
end
