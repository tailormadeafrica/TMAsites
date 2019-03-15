module ::Refinery
  class SitemapController < ::Refinery::FastController
    layout nil

    def index
      headers['Content-Type'] = 'application/xml'

      respond_to do |format|
        format.xml do
           send_file("#{Rails.root}/public/sitemap.xml", filename: "sitemap.xml", type: "application/xml")
        end
      end
    end

  end
end