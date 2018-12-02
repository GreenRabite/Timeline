class GenderEnforcedOnPerson < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :gender, :string, null: false
  end
end
