# == Schema Information
# Schema version: 20100310231526
#
# Table name: products
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  seller      :string(255)
#  price       :integer(10)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
has_many :orders, :through => :line_items
has_many :line_items

  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  validates_presence_of :title, :description, :image_url, :seller
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
  validates_format_of :image_url,
                      :with => %r{\.(gif|jpg|png)$}i,
                      :message => 'format gambar harus dalam GIF/JPG/PNG.(gif|jpg\png)'


  has_many :tags


  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


  protected
    def price_must_be_at_least_a_cent
      errors.add(:price, 'should be at least 1') if price.nil? || price < 1
    end

end

