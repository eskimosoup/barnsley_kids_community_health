module Optimadmin
  class PagePresenter < Optimadmin::BasePresenter
    presents :page

    def id
      page.id
    end

    def title
      page.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def content
      h.raw page.content
    end

    def services
      h.content_tag :div, page.service.name, style: 'font-size:12px;line-height:1.2;' if page.service.present?
    end
  end
end
