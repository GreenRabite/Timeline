# == Schema Information
#
# Table name: location_records
#
#  id         :bigint(8)        not null, primary key
#  person_id  :integer          not null
#  location   :string           not null
#  period     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LocationRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
