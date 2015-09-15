class Testimonial < ActiveRecord::Base

  has_many :service_testimonials, dependent: :destroy
  has_many :services, through: :service_testimonials

  scope :displayed, -> { where(display: true) }
  scope :service_home, -> { where(service_home: true) }
  scope :for_service, ->(service) { joins(:service_testimonials).where(service_testimonials: { service_id: service.id }) if service.present? }
  scope :service_filter, ->(service_id) { joins(:service_testimonials).where(service_testimonials: { service_id: service_id }) if service_id.present? }

  validates :author, :content, presence: true
end
