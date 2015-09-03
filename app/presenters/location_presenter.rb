class LocationPresenter < BasePresenter
  presents :location

  delegate :name, to: :location

  def opening_times
    h.raw location.opening_times
  end

  def content
    h.raw location.content
  end
end