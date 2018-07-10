class AddActivityTypeToRefineryActivities < ActiveRecord::Migration
  def change
    add_column :refinery_activities, :activity_type, :string
  end
end
