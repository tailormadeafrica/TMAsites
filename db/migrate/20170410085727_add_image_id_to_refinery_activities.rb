class AddImageIdToRefineryActivities < ActiveRecord::Migration
  def change
    add_column :refinery_activities, :image_id, :integer
  end
end
