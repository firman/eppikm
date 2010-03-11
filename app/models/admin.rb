require 'digest/sha1'

class Admin < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :email
  validates_length_of   :name, :maximum => 50
  validates_format_of   :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false

  validates_length_of :name, :in => 2..25
  validates_format_of :name, :with => /\A[a-zA-Z]+\z/,
    :message => "hanya boleh huruf"
 validates_length_of :password, :minimum => 6,
    :message => "password minimal 6 karakter", :on => :create

  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validate :password_non_blank


  def self.authenticate(name, password)
    admin = self.find_by_name(name)
    if admin
      expected_password = encrypted_password(password, admin.salt)
      if admin.hashed_password != expected_password
        admin = nil
      end
    end
    admin
  end


  # 'password' is a virtual attribute

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = Admin.encrypted_password(self.password, self.salt)
  end

  def after_destroy
    if Admin.count.zero?
      raise "TIdak bisa delete admin terakhir"
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

