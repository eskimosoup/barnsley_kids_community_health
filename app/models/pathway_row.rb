class PathwayRow < ActiveRecord::Base

  COLOURS = %w( blue pink )

  belongs_to :pathway_section, counter_cache: true
  scope :displayed, ->{ where(display: true) }
  scope :ordered, -> { order(position: :asc) }

  validates :pathway_section, presence: true
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :colour, presence: true, inclusion: { in: COLOURS }
end
