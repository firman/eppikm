class Message < ActiveRecord::Base
  belongs_to :forum # adds a forum method to Message
  # validators (validates automatically before ActiveRecord.save)
  validates_presence_of :title, :author, :message


end

