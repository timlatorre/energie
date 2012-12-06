# == Schema Information
#
# Table name: zips
#
#  id            :integer          not null, primary key
#  zip_code      :string(255)
#  lat           :float
#  long          :float
#  building_type :string(255)
#  kwh           :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Zip < ActiveRecord::Base
end
