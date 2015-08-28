class Service < ActiveRecord::Base
  COLOURS = %w( pink light_purple dark_purple light_blue dark_blue turquoise green dark_green )

  mount_uploader :icon, ServiceIconUploader
  mount_uploader :image, ServiceImageUploader

  scope :displayed, -> { where(display: true) }

  validates :name, presence: true, uniqueness: true
  validates :colour, presence: true, inclusion: { in: COLOURS }
end
