# == Schema Information
# Schema version: 20100316125409
#
# Table name: forums
#
#  id            :integer(4)      not null, primary key
#  name          :string(64)
#  administrator :string(20)
#  created_on    :datetime
#

class Forum < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  validates_presence_of :name

end

