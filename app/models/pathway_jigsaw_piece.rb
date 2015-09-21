class PathwayJigsawPiece < ActiveRecord::Base

  COLOURS = %w( purple blue green )

  belongs_to :pathway_section, counter_cache: true

  validates :pathway_section, presence: true
  validates :name, presence: true, uniqueness: true
  validates :colour, presence: true, inclusion: { in: COLOURS }
end
