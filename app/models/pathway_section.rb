class PathwaySection < ActiveRecord::Base

  has_many :pathway_rows, ->{ PathwayRow.displayed.ordered }
  has_many :pathway_jigsaw_pieces, ->{ PathwayJigsawPiece.displayed.ordered }

  scope :displayed, ->{ where(display: true) }
  scope :ordered, -> { order(position: :asc) }

  validates :name, presence: true
end
