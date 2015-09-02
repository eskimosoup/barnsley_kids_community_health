class ServicePresenter < BasePresenter
  presents :service
  delegate :name, to: :service

  def linked_name
    h.link_to name, service
  end

  def colour
    service.colour.tr("_", "-")
  end

  def overview
    h.raw service.overview
  end

  def heading_classes
    ["service-header", colour].join(" ")
  end

  def link
    service
  end
end
