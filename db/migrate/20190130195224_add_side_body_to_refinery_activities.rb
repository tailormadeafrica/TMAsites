class AddSideBodyToRefineryActivities < ActiveRecord::Migration
  def change
    add_column :refinery_activities, :side_body, :text
  end
end
