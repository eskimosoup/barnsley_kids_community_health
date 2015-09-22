module Optimadmin
  class PathwaySectionPresenter < Optimadmin::BasePresenter
    presents :pathway_section

    def name
      pathway_section.name
    end

    def pathway_rows_link
      h.link_to h.pluralize(pathway_rows_count, 'Pathway Row'), h.pathway_section_pathway_rows_path(pathway_section)
    end

    def pathway_jigsaw_pieces_link
      h.link_to h.pluralize(pathway_jigsaws_count, 'Pathway Row'), h.pathway_section_pathway_jigsaw_pieces_path(pathway_section)
    end

    def pathway_rows_count
      pathway_section.pathway_rows_count
    end

    def pathway_jigsaws_count
      pathway_section.pathway_jigsaw_pieces_count
    end
  end
end