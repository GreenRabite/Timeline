# == Schema Information
#
# Table name: people
#
#  id             :bigint(8)        not null, primary key
#  first_name     :string           not null
#  last_name      :string
#  birthday       :date
#  deathday       :date
#  gender         :string           not null
#  profile_img    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  middle_name    :string
#  phone_number   :string
#  email          :string
#  family_tree_id :integer          not null, is an Array
#

class Person < ApplicationRecord
  validates :first_name, :gender, :family_tree_id, presence: true

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
    fathers = []
    parents.each do |parent|
      fathers << parent if parent.gender == 'male'
    end
    fathers
  end

  
  def mother
    mothers = []
    parents.each do |parent|
      mothers << parent if parent.gender == 'female'
    end
    mothers
  end

  def husband
    people = Person.where(id: relationship_ids)
    husbands = []
    people.each do |person|
      husbands << person if person.gender == 'male'
    end
    husbands
  end

  def wife
    people = Person.where(id: relationship_ids)
    wifes = []
    people.each do |person|
      wifes << person if person.gender == 'female'
    end
    wifes
  end

  def add_partner(partner_id)
    partner = Relationship.new(alpha_id: partner_id, beta_id: id, relationship_type: 'married')
    if partner.save
      partner
    else
      nil
    end
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
