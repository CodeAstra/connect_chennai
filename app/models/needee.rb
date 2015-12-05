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
    GET_OUT   = {code: 1, text: "Getting Out of Chennai"}
    FOOD      = {code: 2, text: "Food"}
    SHELTER   = {code: 3, text: "Shelter"}
    VOLUNTEER = {code: 4, text: "Volunteer Work"}

    def self.needs
      [GET_OUT, FOOD, SHELTER].collect{|need| OpenStruct.new need}
    end

    def self.all_needs
      [GET_OUT, FOOD, SHELTER, VOLUNTEER].collect{|need| OpenStruct.new need}
    end

    def self.helps
      [GET_OUT, FOOD, SHELTER, VOLUNTEER].collect{|help| [help[:text], help[:code]]}
    end

    def self.help_name(code)
      self.helps.each do |arr|
        return arr[0] if arr[1] == code
      end
    end
  end

  belongs_to :locality
end
