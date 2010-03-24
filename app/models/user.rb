# == Schema Information
# Schema version: 20100316125409
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  username          :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic
  has_many :products
  has_many :assignments
  has_many :roles, :through => :assignments

  named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0"} }


  ROLES = %w[admin pelanggan penjual]
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    roles.map(&:to_sym)
  end


end

