class ImageImporterWorker
  include Sidekiq::Worker
  def perform(gallery_id)
    image_import = Refinery::ImageImporter.new(gallery_id)
    image_import.import
  end
end