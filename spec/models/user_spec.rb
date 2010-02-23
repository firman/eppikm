# == Schema Information
# Schema version: 20100223015430
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  alamat             :text
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(255)
#  encrypted_password :string(255)
#

require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :email => "value for email",
      :alamat => "value for alamat",
      :nokontak => 1
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
