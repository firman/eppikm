# == Schema Information
# Schema version: 20100503150511
#
# Table name: tags
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  product_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :product
end
