class AddVideoUrlToRefineryBlogPosts < ActiveRecord::Migration
  def change
    add_column :refinery_blog_posts, :video_url, :string
  end
end
