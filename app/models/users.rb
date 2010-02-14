# == Schema Information
# Schema version: 20100214071253
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  alamat     :text
#  created_at :datetime
#  updated_at :datetime
#

class Users < ActiveRecord::Base
end
