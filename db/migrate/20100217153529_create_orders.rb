class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :nama
      t.string :email
      t.text :alamat


      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end

