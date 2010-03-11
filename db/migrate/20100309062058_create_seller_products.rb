class CreateSellerProducts < ActiveRecord::Migration
  def self.up
    create_table :seller_products do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :seller_products
  end
end
