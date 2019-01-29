# This migration comes from refinery_newsletter (originally 20110803223528)
class AddCustomTeaserFieldToNewsletterPosts < ActiveRecord::Migration
  def change
    add_column Refinery::Newsletter::Post.table_name, :custom_teaser, :text
  end
end

