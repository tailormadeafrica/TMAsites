Refinery::Portfolio.configure do |config|
  # How many images should we display in the back end?
  # config.items_per_page = 20

  # How big should gallery thumbs be?
  # config.cover_image_thumb_size = "300x200"

  # See http://thiagosf.net/projects/jquery/skitter/ for terrible documentation.
  # config.skitter_options = {:interval=>5000, :animation=>:circles, :numbers=>true, :dots=>false, :navigation=>true, :hideTools=>false, :fullscreen=>false, :numbers_align=>:center}
 
  # Display image title and description?
  # config.display_item_text = true

  # Display gallery description?
  # config.display_gallery_text = true

  require 'aws-sdk'
  ::Aws.config.update({
                        region: 'us-east-1',
                        credentials: ::Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET']),
                    })

  S3_BUCKET = ::Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
end
