Refinery::Resources.configure do |config|
  # Configures the maximum allowed upload size (in bytes) for a file upload
  # config.max_file_size = 52428800

  # Configure how many resources per page should be displayed when a dialog is presented that contains resources
  # config.pages_per_dialog = 12

  # Configure how many resources per page should be displayed in the list of resources in the admin area
  # config.pages_per_admin_index = 20

  # Configure S3 (you can also use ENV for this)
  # The s3_backend setting by default defers to the core setting for this but can be set just for resources.
  # config.s3_backend = Refinery::Core.s3_backend
  # config.s3_bucket_name = ENV['S3_BUCKET']
  # config.s3_access_key_id = ENV['S3_KEY']
  # config.s3_secret_access_key = ENV['S3_SECRET']
  # config.s3_region = ENV['S3_REGION]

  # Configure Dragonfly
  # This is where in the middleware stack to insert the Dragonfly middleware
  # config.dragonfly_insert_before = "ActionDispatch::Callbacks"
  # config.dragonfly_secret = "b37ce8614195c944d12b2c96361b1b9748ad2fb74e38daa3"
  # config.dragonfly_url_format = "/system/resources/:job/:basename.:format"
    config.dragonfly_url_format = "/system/resources/:job/:basename.:format"
    if Rails.env.production?
      config.dragonfly_url_host = ENV['CLOUDFRONT_ENDPOINT']
    end
  # config.datastore_root_path = "C:/Dev/Workspace/tailor_made_africa/tailor_made_africa/public/system/refinery/resources"

end
