class Location < ActiveRecord::Base

  has_many :service_locations, dependent: :destroy
  has_many :services, through: :service_locations

  scope :displayed, -> { where(display: true) }

  validates :name, :content, :opening_times, presence: true
end
