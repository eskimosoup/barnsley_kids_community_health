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

    def view_link
      h.link_to eye, main_site_url, target: '_blank', class: 'menu-item-control'
    end

    private

    def main_site_url
      base_url + h.main_app.page_path(page)
    end

    def service
      page.service
    end

    def base_url
      [protocol, subdomain, ".", domain, port].compact.join
    end

    def protocol
      h.request.protocol
    end

    def subdomain
      if service
        service.subdomain
      else
        "www"
      end
    end

    def domain
      h.request.domain
    end

    def port
      ":#{ h.request.port }" if h.request.port
    end
  end
end
