class Message < ActiveRecord::Base
  belongs_to :forum_id

  validates_presence_of :title, :author, :email, :message
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

end

