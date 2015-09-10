module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service
    delegate :name, to: :service

    def toggle_title
      inline_detail_toggle_link(name)
    end
  end
end
