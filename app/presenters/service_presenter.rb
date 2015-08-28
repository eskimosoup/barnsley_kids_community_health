class ServicePresenter < BasePresenter
  presents :service
  delegate :name, :colour, to: :service

  def overview
    h.raw service.overview
  end

end