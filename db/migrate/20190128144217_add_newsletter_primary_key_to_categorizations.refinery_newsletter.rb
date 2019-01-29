# This migration comes from refinery_newsletter (originally 20110803223529)
class AddNewsletterPrimaryKeyToCategorizations < ActiveRecord::Migration
  def up
    unless Refinery::NewsletterCategorization.column_names.include?("id")
      add_column Refinery::NewsletterCategorization.table_name, :id, :primary_key
    end
  end

  def down
    if Refinery::NewsletterCategorization.column_names.include?("id")
      remove_column Refinery::NewsletterCategorization.table_name, :id
    end
  end
end

