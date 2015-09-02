class ServicePresenter < BasePresenter
  presents :service
  delegate :name, :subdomain, to: :service

  def linked_name
    h.link_to name, subdomain_link
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

  private

  def subdomain_link
    [subdomain, h.request.host_with_port].join(".")
  end

end