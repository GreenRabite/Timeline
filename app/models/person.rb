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
#  gender         :string           not null
#  profile_img    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  middle_name    :string
#

class Person < ApplicationRecord
  validates :first_name, :gender, presence: true

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

  def father
    father = []
    parents.each do |parent|
      father << parent if parent.gender == 'male'
    end
    father
  end

  
  def mother
    mother = []
    parents.each do |parent|
      mother << parent if parent.gender == 'female'
    end
    mother
  end

  def husband
    people = Person.where(id: relationship_ids)
    husband = []
    people.each do |person|
      husband << person if person.gender == 'male'
    end
    husband
  end

  def wife
    people = Person.where(id: relationship_ids)
    wife = []
    people.each do |person|
      wife << person if person.gender == 'female'
    end
    wife
  end

  def add_parent(parent_id)
    parent = Relationship.new(alpha_id: parent_id, beta_id: id, relationship_type: 'parent')
    if parent.save
      parent
    else
      nil
    end
  end

  def children
    children_ids = Relationship.where(alpha_id: id, relationship_type: 'parent').pluck(:beta_id)
    Person.where(id: children_ids)
  end

  def siblings
    kids = Relationship.where(alpha_id: parents).pluck(:beta_id)
    Person.where(id: kids) - [self]
  end

  private

  def relationship_ids
    relationships = Relationship.where(alpha_id: id, relationship_type: 'married').or(Relationship.where(beta_id: id, relationship_type: 'married')).pluck(:alpha_id, :beta_id).first&.uniq
    if relationships
      relationships - [self.id]
    else
      []
    end
  end

end
