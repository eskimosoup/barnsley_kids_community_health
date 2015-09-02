class ContactDetail < ActiveRecord::Base
  belongs_to :service

  def self.for_service(service)
    if service.present?
      find_by(service: service)
    else
      find_by("service_id IS NULL")
    end
  end

  delegate :name, to: :service, prefix: true, allow_nil: true

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :service_id, uniqueness: true

end
