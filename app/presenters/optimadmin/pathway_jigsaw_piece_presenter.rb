module Optimadmin
  class PathwayJigsawPiecePresenter < Optimadmin::BasePresenter
    presents :pathway_jigsaw_piece

    def name
      pathway_jigsaw_piece.name
    end

    def colour
      pathway_jigsaw_piece.colour
    end

    def edit_link
      h.link_to pencil, h.edit_pathway_section_pathway_jigsaw_piece_url(pathway_jigsaw_piece.pathway_section_id, pathway_jigsaw_piece),
                class: 'menu-item-control'
    end

    def delete_link
      h.link_to trash_can, h.pathway_section_pathway_jigsaw_piece_url(pathway_jigsaw_piece.pathway_section_id, pathway_jigsaw_piece),
                method: :delete, data: { confirm: 'Are you sure?' }, class: 'menu-item-control'
    end
  end
end