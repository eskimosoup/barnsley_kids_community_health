module Optimadmin
  class PathwayRowPresenter < Optimadmin::BasePresenter
    presents :pathway_row

    def name
      pathway_row.name
    end

    def colour
      pathway_row.colour
    end

    def edit_link
      h.link_to pencil, h.edit_pathway_section_pathway_row_url(pathway_row.pathway_section_id, pathway_row), class: 'menu-item-control'
    end

    def delete_link
      h.link_to trash_can, h.pathway_section_pathway_row_url(pathway_row.pathway_section_id, pathway_row),
                method: :delete, data: { confirm: 'Are you sure?' }, class: 'menu-item-control'
    end

  end
end