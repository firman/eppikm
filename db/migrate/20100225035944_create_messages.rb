class CreateMessages < ActiveRecord::Migration
  def self.up
   create_table :messages do |t|
      t.column :title, :string, :limit => 64
      t.column :author, :string, :limit => 20
      t.column :created_on, :timestamp
      t.column :message, :text
      t.column :seller_id, :integer
    end

    Message.create :title => "Assalamu'alaikum'",
   :author => "rio",
   :message => "mari kita berdiskusi dan sharing",
   :seller_id => 2

    end


  def self.down
    drop_table :messages
  end
end

