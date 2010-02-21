# == Schema Information
# Schema version: 20100217161627
#
# Table name: sellers
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  email           :string(255)
#  alamat          :text
#  hashed_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'digest/sha1'

class Seller < ActiveRecord::Base
  validates_presence_of     :name, :email, :alamat
  validates_uniqueness_of   :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validate :password_non_blank

   def self.authenticate(name, password)
    seller = self.find_by_name(name)
    if seller
      expected_password = encrypted_password(password, seller.salt)
      if seller.hashed_password != expected_password
        seller = nil
      end
    end
    seller
  end


  # 'password' is a virtual attribute

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = Seller.encrypted_password(self.password, self.salt)
  end



private

  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end



  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end



  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end


end

