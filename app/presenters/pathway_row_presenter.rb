class PathwayRowPresenter < BasePresenter
  presents :pathway_row

  def name
    pathway_row.name
  end

  def colour
    pathway_row.colour
  end

  def content
    h.raw pathway_row.content
  end
end