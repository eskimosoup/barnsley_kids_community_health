class PageUploader < Optimadmin::ImageUploader

  version :show do
    process resize_to_fill: [756, 200]
  end

end
