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

class Needee < ActiveRecord::Base
  module HelpType
    GET_OUT   = 1
    FOOD      = 2
    SHELTER   = 3
    VOLUNTEER = 4
  end

  belongs_to :locality
end
