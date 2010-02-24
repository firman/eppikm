class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.column :name, :string, :limit => 64
      t.column :administrator, :string, :limit => 20
      t.column :created_on, :timestamp
    end # do block

end # method self.up


  def self.down
    drop_table :forums
  end
end

