class ServiceImageUploader < Optimadmin::ImageUploader

  version :homepage do
    process resize_to_fill: [150, 150]
  end
end