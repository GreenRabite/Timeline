# == Schema Information
#
# Table name: relationships
#
#  id                :bigint(8)        not null, primary key
#  alpha_id          :integer          not null
#  beta_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  relationship_type :string
#

class Relationship < ApplicationRecord
  validates :alpha_id, :beta_id, :relationship_type, presence: true
end
