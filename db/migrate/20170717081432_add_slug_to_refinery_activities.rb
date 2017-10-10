class AddSlugToRefineryActivities < ActiveRecord::Migration
  def change
    add_column :refinery_activities, :slug, :string
  end
end
