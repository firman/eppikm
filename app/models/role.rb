# == Schema Information
# Schema version: 20100330191514
#
# Table name: roles
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_many :assignments
  has_many :user, :through => :assignments
end

