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

  def lightbox_id
    "pathway-row-#{ pathway_row.id }-content"
  end

  def lightbox_link
    h.link_to name, "##{ lightbox_id }", class: fancybox_classes, rel: "pathway"
  end

  private

  def fancybox_classes
    [colour, "pathway-row", "fancybox"].compact.join(" ")
  end
end