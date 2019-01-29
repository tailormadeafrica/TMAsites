# This migration comes from refinery_newsletter (originally 20120223022021)
class AddNewsletterAccessCountToPosts < ActiveRecord::Migration
  def change
    add_column Refinery::Newsletter::Post.table_name, :access_count, :integer, :default => 0
    
    add_index Refinery::Newsletter::Post.table_name, :access_count
    
  end
end