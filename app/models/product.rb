# == Schema Information
# Schema version: 20100503150511
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
#  user_id     :integer(4)      not null
#  page_count  :integer(4)
#

class Product < ActiveRecord::Base
has_many :orders, :through => :line_items
has_many :line_items
belongs_to :user

acts_as_ferret :fields => [:title]

  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_format_of :image_url,
                      :with => %r{\.(gif|jpg|png)$}i,
                      :message => 'format gambar harus dalam GIF/JPG/PNG.(gif|jpg\png)'


  has_many :tags


  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end


  protected
    def price_must_be_at_least_a_cent
      errors.add(:price, 'should be at least 1') if price.nil? || price < 1
    end

end

