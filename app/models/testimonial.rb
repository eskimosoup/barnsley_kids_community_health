class Testimonial < ActiveRecord::Base

  has_many :service_testimonials, dependent: :destroy
  has_many :services, through: :service_testimonials

  scope :displayed, -> { where(display: true) }

  validates :author, :content, presence: true
end
