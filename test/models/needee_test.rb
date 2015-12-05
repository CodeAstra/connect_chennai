# == Schema Information
#
# Table name: needees
#
#  id           :integer          not null, primary key
#  name         :string
#  phone        :string
#  locality_id  :integer
#  address      :text
#  details      :text
#  type_of_help :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class NeedeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
