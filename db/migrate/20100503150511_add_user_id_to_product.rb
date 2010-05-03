class AddUserIdToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :user_id, :integer, :null => false
    add_column :products, :page_count, :integer
  end

  def self.down
    remove_column :products, :user_id
    remove_column :products, :page_count
  end
end
