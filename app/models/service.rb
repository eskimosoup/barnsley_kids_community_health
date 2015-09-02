class Service < ActiveRecord::Base
  COLOURS = %w( pink light_purple dark_purple light_blue dark_blue turquoise green dark_green )

  MENU_NAMES = NavigationMenus.delete_if { |name| %w( header footer ).include?(name) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :icon, ServiceIconUploader
  mount_uploader :image, ServiceImageUploader

  has_many :service_testimonials, dependent: :destroy
  has_many :testimonials, through: :service_testimonials
  has_many :service_frequently_asked_questions, dependent: :destroy
  has_many :frequently_asked_questions, through: :service_frequently_asked_questions
  has_many :pages, dependent: :nullify

  scope :displayed, -> { where(display: true) }

  validates :name, presence: true, uniqueness: true
  validates :colour, presence: true, inclusion: { in: COLOURS }

  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || name_changed?
  end
end
