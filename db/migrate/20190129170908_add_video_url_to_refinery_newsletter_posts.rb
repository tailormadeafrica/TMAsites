class AddVideoUrlToRefineryNewsletterPosts < ActiveRecord::Migration
  def change
    add_column :refinery_newsletter_posts, :video_url, :integer
  end
end
