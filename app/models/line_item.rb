# == Schema Information
# Schema version: 20100221151456
#
# Table name: line_items
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)      not null
#  order_id    :integer(4)      not null
#  quantity    :integer(4)      not null
#  total_price :decimal(8, 2)   not null
#  created_at  :datetime
#  updated_at  :datetime
#

class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  def self.from_cart_item(cart_item)
    li = self.new
    li.product      = cart_item.product
    li.quantity     = cart_item.quantity
    li.total_price = cart_item.price
    li
  end
end

