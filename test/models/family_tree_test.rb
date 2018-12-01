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

require 'test_helper'

class FamilyTreeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
