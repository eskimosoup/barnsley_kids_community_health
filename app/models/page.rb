class Page < ActiveRecord::Base

  belongs_to :service

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, PageUploader

  scope :displayed, ->{ where(display: true) }
  scope :for_service, ->(service) { where("service_id = ?", service.id) if service.present? }

  before_save :store_image, if: Proc.new{|page| page.remote_image_url.blank? }
  # before_save :store_file, if: Proc.new{|page| page.remote_file_url.blank? }

  before_save :update_page_name

  validates :title, :content, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { message: 'is not unique, leave this blank to generate automatically' }

  delegate :name, :subdomain, to: :service, prefix: true, allow_nil: true

  def update_page_name
    if self.service.present?
      self.name = "#{self.title} (#{self.service.name})"
    else
      self.name = self.title
    end
  end

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title],
      [:suggested_url, :title, :service_name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end

  def self.layouts
    %w{ application }
  end

  def self.styles
    %w{ basic pathway }
  end

  def store_image
    Optimadmin::Image.store_image(self, image) if image.present? && image_changed?
  end

  def self.service_filter(service_id)
    if service_id.blank?
      where("true")
    else
      where(service_id: service_id)
    end
  end

  # def store_file
  #   Optimadmin::Document.store_file(self, file) if file.present? && file_changed?
  # end
end
