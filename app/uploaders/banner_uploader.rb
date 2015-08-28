class BannerUploader < Optimadmin::ImageUploader

  version :homepage do
    process resize_to_fill: [560, 276]
  end

end