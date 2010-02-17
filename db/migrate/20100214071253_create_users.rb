class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :alamat
      t.int :nokontak

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

