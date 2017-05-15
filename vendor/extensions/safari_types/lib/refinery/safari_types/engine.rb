module Refinery
  module SafariTypes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::SafariTypes

      engine_name :refinery_safari_types

      initializer "register refinerycms_safari_types plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "safari_types"
          plugin.hide_from_menu = true
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.safari_types_admin_safari_types_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/safari_types/safari_type',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SafariTypes)
      end
    end
  end
end
