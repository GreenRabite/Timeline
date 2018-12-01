# == Schema Information
#
# Table name: family_trees
#
#  id           :bigint(8)        not null, primary key
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string           not null
#  family_image :string
#

class FamilyTree < ApplicationRecord
  validates :name, presence: true

  has_many :people,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Person
end
