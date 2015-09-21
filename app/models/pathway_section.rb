class PathwaySection < ActiveRecord::Base

  has_many :pathway_rows
  has_many :pathway_jigsaw_pieces

  validates :name, presence: true
end
