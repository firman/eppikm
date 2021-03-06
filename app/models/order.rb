# == Schema Information
# Schema version: 20100503150511
#
# Table name: orders
#
#  id         :integer(4)      not null, primary key
#  nama       :string(255)
#  email      :string(255)
#  alamat     :text
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  validates_presence_of :nama, :email
  belongs_to :user
  has_many :line_items

  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end

end

