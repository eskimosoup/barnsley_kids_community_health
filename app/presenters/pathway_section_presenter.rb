class PathwaySectionPresenter < BasePresenter
  presents :pathway_section

  def pathway_rows
    @pathway_rows ||= pathway_section.pathway_rows
  end

  def pathway_jigsaw_pieces
    @pathway_jigsaw_pieces ||= pathway_section.pathway_jigsaw_pieces
  end

  def presented_pathway_rows
    pathway_rows.map{|x| PathwayRowPresenter.new(object: x, view_template: h)}
  end

  def presented_pathway_jigsaw_pieces
    pathway_jigsaw_pieces.map{|x| PathwayJigsawPiecePresenter.new(object: x, view_template: h)}
  end
end