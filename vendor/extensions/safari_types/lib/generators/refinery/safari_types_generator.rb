module Refinery
  class SafariTypesGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_safari_types:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Safari Types extension
Refinery::SafariTypes::Engine.load_seed
        EOH
      end
    end
  end
end
