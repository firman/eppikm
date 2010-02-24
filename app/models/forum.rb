class Forum < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  validates_presence_of :name

end

