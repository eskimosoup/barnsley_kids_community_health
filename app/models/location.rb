class Location < ActiveRecord::Base

  has_many :service_locations, dependent: :destroy
  has_many :services, through: :service_locations

  scope :displayed, -> { where(display: true) }
  scope :for_service, ->(service) { joins(:service_locations).where(service_locations: { service_id: service.id }) if service.present? }
  scope :service_filter, ->(service_id) { joins(:service_locations).where(service_locations: { service_id: service_id }) if service_id.present? }

  validates :name, :content, :opening_times, presence: true
end
