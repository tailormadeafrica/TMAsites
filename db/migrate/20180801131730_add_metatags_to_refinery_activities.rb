class AddMetatagsToRefineryActivities < ActiveRecord::Migration
  def change
    add_column :refinery_activities, :browser_title, :string
    add_column :refinery_activities, :meta_description, :string
  end
end
