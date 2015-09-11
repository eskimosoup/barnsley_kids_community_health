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
  end
end
