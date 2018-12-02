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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
