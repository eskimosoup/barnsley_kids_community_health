class PathwayRow < ActiveRecord::Base

  COLOURS = %w( pink blue )

  belongs_to :pathway_section, counter_cache: true

  validates :pathway_section, presence: true
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :colour, presence: true, inclusion: { in: COLOURS }
end
