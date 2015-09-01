class Banner < ActiveRecord::Base

  mount_uploader :image, BannerUploader

  scope :displayed, -> { where(display: true) }

  validates :name, :image, presence: true
end
