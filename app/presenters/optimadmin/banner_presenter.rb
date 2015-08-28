module Optimadmin
  class BannerPresenter < Optimadmin::BasePresenter
    presents :banner

    delegate :name, to: :banner
  end
end