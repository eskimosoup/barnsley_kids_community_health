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
  end
end
