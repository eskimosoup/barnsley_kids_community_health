module Optimadmin
  class ContactDetailPresenter < Optimadmin::BasePresenter
    presents :contact_detail

    delegate :name, to: :contact_detail

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.raw contact_detail.address
    end

    def services
      h.content_tag :div, contact_detail.service.name, style: 'font-size:12px;line-height:1.2;' if contact_detail.service.present?
    end
  end
end
