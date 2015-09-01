module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service
    delegate :name, to: :service
  end
end