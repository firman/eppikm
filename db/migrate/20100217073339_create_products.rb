class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :seller
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
