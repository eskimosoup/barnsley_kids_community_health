class FrequentlyAskedQuestion < ActiveRecord::Base

  has_many :service_frequently_asked_questions, dependent: :destroy
  has_many :services, through: :service_frequently_asked_questions

  scope :displayed, -> { where(display: true) }
  scope :service_home, -> { where(service_home: true) }
  scope :for_service, ->(service) { joins(:service_frequently_asked_questions).where(service_frequently_asked_questions: { service_id: service.id }) if service.present? }
  scope :service_filter, ->(service_id) { joins(:service_frequently_asked_questions).where(service_frequently_asked_questions: { service_id: service_id }) if service_id.present? }

  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true
end
