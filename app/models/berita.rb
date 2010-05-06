# == Schema Information
# Schema version: 20100503150511
#
# Table name: beritas
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Berita < ActiveRecord::Base
  validates_presence_of :title, :content
  validates_uniqueness_of :title
end

