# == Schema Information
#
# Table name: events
#
#  id                         :integer         not null, primary key
#  name                       :string(255)
#  location                   :string(255)
#  begin_at                   :datetime
#  end_at                     :datetime
#  link                       :string(255)
#  description                :text
#  preview_image_file_name    :string(255)
#  preview_image_content_type :string(255)
#  preview_image_file_size    :integer
#  preview_image_updated_at   :datetime
#  created_at                 :datetime
#  updated_at                 :datetime
#
class Ecm::Event < ActiveRecord::Base
  has_attached_file :preview_image, :styles => { :original => "110x110>" }
  
  
  validates :begin_at, :presence => true
  validates :link,     :presence => true  
  validates :location, :presence => true  
  validates :name,     :presence => true
  
  def self.in_month(year, month)
    if year and month
      begin_of_month = Date.new(year.to_i, month.to_i).beginning_of_month
    else
      begin_of_month = Date.today.beginning_of_month
    end
    end_of_month = begin_of_month.end_of_month 
    where("begin_at > ? AND begin_at < ?", begin_of_month, end_of_month)
  end
end
