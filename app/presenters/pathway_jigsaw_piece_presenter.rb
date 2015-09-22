class PathwayJigsawPiecePresenter < BasePresenter
  presents :pathway_jigsaw_piece

  def name
    pathway_jigsaw_piece.name
  end

  def colour
    pathway_jigsaw_piece.colour
  end

  def classes
    [colour, "pathway-jigsaw-piece"].compact.join(" ")
  end
end
