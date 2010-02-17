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

 attr_accessible :name, :email, :alamat, :nokontak

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :email, :alamat, :nokontak
  validates_length_of   :name, :maximum => 50
  validates_length_of   :alamat, :maximum => 100
  validates_format_of   :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false


end

