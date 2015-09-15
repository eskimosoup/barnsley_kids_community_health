module Optimadmin
  class LocationPresenter < Optimadmin::BasePresenter
    presents :location

    delegate :name, to: :location

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.raw location.content
    end

    def services
      h.content_tag :div, location.services.pluck(:name).join(', '), style: 'font-size:12px;line-height:1.2;' if location.services.present?
    end
  end
end
