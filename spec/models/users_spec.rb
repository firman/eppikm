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

require 'spec_helper'

describe Users do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email",
      :alamat => "value for alamat",
      :no_kontak => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Users.create!(@valid_attributes)
  end
end
