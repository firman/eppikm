# == Schema Information
# Schema version: 20100310231526
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
  validates_uniqueness_of   :name, :case_sensitive => false
  validates_uniqueness_of   :email
  validates_format_of :email,
     :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_length_of :name, :in => 2..25
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/,
    :message => "hanya boleh huruf"
 validates_length_of :password, :minimum => 6,
    :message => "password minimal 6 karakter", :on => :create

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

  def after_destroy
    if Seller.count.zero?
      raise "TIdak bisa delete seller terakhir"
    end
  end


private

  def password_non_blank
    errors.add(:password, "password salah") if hashed_password.blank?
  end



  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end



  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end


end

