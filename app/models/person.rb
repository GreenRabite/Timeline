# == Schema Information
#
# Table name: people
#
#  id             :bigint(8)        not null, primary key
#  first_name     :string           not null
#  last_name      :string
#  birthday       :date
#  deathday       :date
#  family_tree_id :integer
#  gender         :string
#  profile_img    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  middle_name    :string
#

class Person < ApplicationRecord
  validates :first_name, presence: true

  # Associations
  # Family Tree - can be associated with other family trees
  # through marriage
  has_many :family_trees,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :FamilyTree

  def parents
    parent_ids = Relationship.where(beta_id: id, relationship_type: 'parent').pluck(:alpha_id)
    Person.where(id: parent_ids)
  end
end
