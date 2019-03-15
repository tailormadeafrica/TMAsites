module ::Refinery
  class SitemapController < ::Refinery::FastController
    layout nil

    def index
      headers['Content-Type'] = 'application/xml'

      respond_to do |format|
        format.xml do
            render :file=>"#{Rails.root}/public/sitemap.xml", :content_type => 'application/xml'
        end
      end
    end

  end
end