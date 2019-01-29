class AddImageIdToRefineryNewsletterPosts < ActiveRecord::Migration
  def change
    add_column :refinery_newsletter_posts, :image_id, :integer
  end
end
