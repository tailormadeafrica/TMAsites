class CreateSafariTypesSafariTypes < ActiveRecord::Migration

  def up
    create_table :refinery_safari_types do |t|
      t.string :name
      t.integer :image_id
      t.text :body
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-safari_types"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/safari_types/safari_types"})
    end

    drop_table :refinery_safari_types

  end

end
