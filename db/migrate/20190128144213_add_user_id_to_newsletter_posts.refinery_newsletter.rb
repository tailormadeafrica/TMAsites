# This migration comes from refinery_newsletter (originally 20110803223523)
class AddUserIdToNewsletterPosts < ActiveRecord::Migration

  def change
    add_column Refinery::Newsletter::Post.table_name, :user_id, :integer
  end

end