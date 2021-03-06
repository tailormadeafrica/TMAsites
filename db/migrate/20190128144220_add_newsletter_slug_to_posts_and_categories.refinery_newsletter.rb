# This migration comes from refinery_newsletter (originally 20120227022021)
class AddNewsletterSlugToPostsAndCategories < ActiveRecord::Migration
  def change
    add_column Refinery::Newsletter::Post.table_name, :slug, :string
    add_index Refinery::Newsletter::Post.table_name, :slug

    add_column Refinery::Newsletter::Category.table_name, :slug, :string
    add_index Refinery::Newsletter::Category.table_name, :slug
  end
end