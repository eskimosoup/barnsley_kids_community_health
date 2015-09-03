module Optimadmin
  class LocationPresenter < Optimadmin::BasePresenter
    presents :location

    delegate :name, to: :location
  end
end