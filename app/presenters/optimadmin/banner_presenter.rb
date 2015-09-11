module Optimadmin
  class BannerPresenter < Optimadmin::BasePresenter
    presents :banner

    delegate :name, to: :banner

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.image_tag banner.image.homepage
    end
  end
end
