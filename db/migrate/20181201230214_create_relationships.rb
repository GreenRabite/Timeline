class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.string :type, null: false
      t.integer :alpha_id, null: false
      t.string :beta_id, null: false
      t.timestamps
    end
    add_index :relationships, :alpha_id
    add_index :relationships, :beta_id
    add_index :relationships, :type
  end
end
