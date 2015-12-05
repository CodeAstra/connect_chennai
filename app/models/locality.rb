# == Schema Information
#
# Table name: localities
#
#  id         :integer          not null, primary key
#  name       :string
#  latitude   :string
#  longitude  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Locality < ActiveRecord::Base
end
