# == Schema Information
# Schema version: 20100224092306
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  title      :string(64)
#  author     :string(20)
#  created_on :datetime
#  email      :string(40)
#  message    :text
#  forum_id   :integer(4)
#

class Message < ActiveRecord::Base


  validates_presence_of :title, :author, :email, :message
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

end

