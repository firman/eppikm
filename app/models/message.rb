# == Schema Information
# Schema version: 20100310231526
#
# Table name: messages
#
#  id         :integer(4)      not null, primary key
#  title      :string(64)
#  author     :string(20)
#  created_on :datetime
#  message    :text
#  seller_id  :integer(4)
#

class Message < ActiveRecord::Base
  belongs_to :forum # adds a forum method to Message
  # validators (validates automatically before ActiveRecord.save)
  validates_presence_of :title, :author, :message


end

