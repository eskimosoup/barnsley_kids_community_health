class ServiceIconUploader < Optimadmin::ImageUploader
  # Just use thumb version in optimadmin uploader

  version :show do
    process resize_to_fill: [32, 32]
  end
end
