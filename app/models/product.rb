class Product < ActiveRecord::Base

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

  protected
    def price_must_be_at_least_a_cent
      errors.add(:price, 'should be at least 1') if price.nil? || price < 1
    end

end

